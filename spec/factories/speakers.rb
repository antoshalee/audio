# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :speaker do
    user nil
    account_number "001345678"
    sex true
    timbre_level 0
  end
end
