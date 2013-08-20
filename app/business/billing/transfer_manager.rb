class Billing::TransferManager
  attr_accessor :sender_acc, :recipient_acc, :value

  # Use mechanism of validations to check transfer possibility
  include ActiveModel::Validations
  validates_presence_of :sender_acc, :recipient_acc, :value
  validate :validate_sender_balance

  def initialize sender_acc, recipient_acc, value
    @sender_acc = sender_acc
    @recipient_acc = recipient_acc
    @value = value
  end

  def transfer_possible?
    valid?
  end

  def transfer
    raise Billing::Errors::TransferIsNotPossible.new unless transfer_possible?
    ActiveRecord::Base.transaction do
      transfer_obj = Billing::Transfer.create!(sender_account: @sender_acc,
        recipient_account: @recipient_acc, value: @value)
      # create operations for sender and recipient
      Billing::Operation.create!(account: @sender_acc, value: -@value, document: transfer_obj)
      Billing::Operation.create!(account: @recipient_acc, value: @value, document: transfer_obj)
    end
  end

  private

  def validate_sender_balance
    if @sender_acc && @sender_acc.balance < @value
      errors.add(:base, "Недостаточно средств у отправителя для осуществления перевода")
    end
  end

end