# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :partnership do
    from_id 1
    to_id 1
    section_id 1
    accepted false
  end
end
