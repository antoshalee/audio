# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :billing_account, :class => 'Billing::Account' do
    balance 1
    user nil
  end
end
