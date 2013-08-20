# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :billing_transfer, :class => 'Billing::Transfer' do
    value 1
    association :sender_account, factory: :billing_account
    association :recipient_account, factory: :billing_account
  end
end
