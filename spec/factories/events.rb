# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    kind "MyString"
    message "MyText"
    user nil
    order nil
  end
end
