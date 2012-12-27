# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :commit do
    sequence(:message) { |n| "message#{n}" }
    sequence(:revision) { |n| "revisiton#{n}"}
  end
end
