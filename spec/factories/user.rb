FactoryGirl.define do
  factory :user do
     sequence(:first_name) { |n| "first_name_#{n}" }
     sequence(:last_name) { |n| "last_name_#{n}" }
  end
end
