class Billing::Operation < ActiveRecord::Base
  belongs_to :account
  belongs_to :document
end
