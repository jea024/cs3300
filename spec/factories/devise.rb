FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@test.com" }
    password {"password"}
  end
end