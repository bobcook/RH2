require 'faker'

FactoryGirl.define do
  factory :prayer do
    member
    date Faker::Date.between(70.days.ago, 20.days.ago)
  end
end
