# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    name "MyString"
    email "MyString"
    password_digest "MyString"
    remember_token "MyString"
  end
end
