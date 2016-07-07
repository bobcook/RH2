require 'faker'

FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name Faker::Name.name
    email Faker::Internet.email
    password 'password123'
    password_confirmation 'password123'

    trait :admin do
      role 'admin'
    end

  end
end
