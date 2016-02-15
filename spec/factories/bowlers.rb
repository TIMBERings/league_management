FactoryGirl.define do
  factory :bowler do
    name "MyString"
    usbc_number "MyString"
    association :team, factory: :team
  end

end
