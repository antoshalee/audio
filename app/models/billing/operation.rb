class Billing::Operation < ActiveRecord::Base
  belongs_to :account
  belongs_to :document, polymorphic: true

  validates :account, presence: true
  after_create { self.account.recalculate_balance }



end
