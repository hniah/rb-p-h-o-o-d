FactoryGirl.define do
  factory :consumer do
    name 'Starbucks'
    sequence(:email) { |n| "consumer-#{n}@example.com" }
    device_token '312233'
    platform 'android'
  end
end
