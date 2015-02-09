FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password 'password123'
    password_confirmation 'password123'
  end
end
