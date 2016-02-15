FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@example.com"
    end
    password 'Test1234'
    password_confirmation { 'Test1234' }
  end
end
