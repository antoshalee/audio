class Billing::Account < ActiveRecord::Base
  belongs_to :user
end
