class Billing::Transfer < ActiveRecord::Base
  belongs_to :sender_account, class_name: 'Billing::Account'
  belongs_to :recipient_account, class_name: 'Billing::Account'

  validates :value, numericality: {greater_than: 0}
  validates :sender_account, presence: true
  validates :recipient_account, presence: true
end
