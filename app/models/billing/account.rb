class Billing::Account < ActiveRecord::Base
  belongs_to :user
  has_many :operations

  validates :user, presence: true

  def recalculate_balance
    self.balance = operations.reduce(0) {|sum, op| sum + op.value}
  end
end
