# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :billing_operation, :class => 'Billing::Operation' do
    association :account, factory: :billing_account
    association :document, factory: :billing_transfer
    value 1
  end
end
