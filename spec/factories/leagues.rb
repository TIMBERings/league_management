FactoryGirl.define do
  start_date = Date.today + rand(0..6).days
  weeks = rand(24..32)
  end_date = (start_date + (weeks * 7).days)
  factory :league do
    name Faker::Company.name
    start_date start_date
    end_date end_date
    day Date.today.day
    start_time '7:00pm'
    practice_length 10
    frequency 1
    occurrences weeks

    association :alley, factory: :alley
    association :administrator, factory: :user
  end
end
