FactoryGirl.define do
  factory :vendor do
    name 'Starbucks'
    sequence(:email) { |n| "vendor-#{n}@example.com" }
    password '123123123'
    description 'Starbucks ia a wonderful cafe'
    reward_detail 'You got a discount of 20% for the foods'
    fax '092 2922'
    phone '6787 3640'


  end
  after(:create)  do |vendor|
    Location.create(address: '4 Tampines Central 5 #01-50, Tampines Mall',latitude: '103.928737', longitude: '1.355223', vendor_id: vendor.id)
  end
end
