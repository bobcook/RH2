FactoryGirl.define do
  factory :speaker do
    date Faker::Date.between(70.day.ago, 5.days.ago)
    member
  end

end
