FactoryGirl.define do
  factory :vendor do
    name 'Starbucks'
    sequence(:email) { |n| "vendor-#{n}@example.com" }
    password '123123123'
    description 'Starbucks ia a wonderful cafe'
    address '4 Tampines Central 5 #01-50, Tampines Mall'
    phone '6787 3640'
    longitude 1.355223
    latitude 103.928737


  end
  after(:create)  do |vendor|
    DataVendor.create(reward_detail: 'Lorem', reward_image: '', vendor_id: vendor.id)
  end
end
