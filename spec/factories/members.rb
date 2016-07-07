require 'faker'

FactoryGirl.define do
  factory :member do
    name { Faker::Name.name }
    gender 'male'
    birth_date Faker::Date.between(70.years.ago, 20.years.ago)
    phone_number Faker::PhoneNumber
    email Faker::Internet.email
  end
end
