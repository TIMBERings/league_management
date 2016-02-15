FactoryGirl.define do
  factory :alley do
    name Faker::Company.name
    association :address, factory: :address
  end
end
