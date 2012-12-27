FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@pragmatic.ly"
  end

  factory :user do
    name { "User#{User.count + 1}" }
    email
  end
end
