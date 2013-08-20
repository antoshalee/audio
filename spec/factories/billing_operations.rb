# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :billing_operation, :class => 'Billing::Operation' do
    account nil
    document nil
    value 1
  end
end
