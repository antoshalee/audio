class Billing::TransferManager
  attr_accessor :sender_account, :recipient_account, :value

  # Use mechanism of validations to check transfer possibility
  include ActiveModel::Validations
  validates_presence_of :sender_account, :recipient_account, :value
  validate :validate_sender_balance
  validate :validate_sender_is_not_recipient

  def initialize sender_account, recipient_account, value
    @sender_account = sender_account
    @recipient_account = recipient_account
    @value = value
  end

  def transfer_possible?
    valid?
  end

  def transfer
    raise Billing::Errors::TransferIsNotPossible.new unless transfer_possible?
    ActiveRecord::Base.transaction do
      transfer_obj = Billing::Transfer.create!(sender_account: @sender_account,
        recipient_account: @recipient_account, value: @value)
      # create operations for sender and recipient
      Billing::Operation.create!(account: @sender_account, value: -@value, document: transfer_obj)
      Billing::Operation.create!(account: @recipient_account, value: @value, document: transfer_obj)
    end
  end

  private

  def validate_sender_balance
    if @sender_account && @sender_account.balance < @value
      errors.add(:base, "Недостаточно средств у отправителя для осуществления перевода")
    end
  end

  def validate_sender_is_not_recipient
    if @sender_account == @recipient_account
      errors.add(:base, "Нельзя переводить деньги самому себе")
    end
  end

end