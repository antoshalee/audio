class Billing::Transfer < ActiveRecord::Base
  belongs_to :recipient_account
  belongs_to :sender_account
end
