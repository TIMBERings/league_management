FactoryGirl.define do
  factory :team do
    name "MyString"
    association :league, factory: :league
  end

end
