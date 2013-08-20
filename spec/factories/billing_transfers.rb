# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :billing_transfer, :class => 'Billing::Transfer' do
    value 1
    recipient_account nil
    sender_account nil
  end
end
