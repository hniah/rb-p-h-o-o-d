# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts '== Creating Admin =='
admin = User.find_by_email 'admin@example.com'
unless admin
  admin = Admin.create!(
      name: 'Admin',
      email: 'admin@example.com',
      password: '123123123'
  )
end

puts '==Creating vendor =='
vendors = Vendor.all
if vendors.count < 100
  (1..100).each do |i|
    Vendor.create(
        name: "Vendor #{i}",
        email: "vendor#{i}@example.com",
        password: '123123123',
        address:  'Somewhere in Singapore',
        description:'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        phone: '6652-3568',
        fax:  '6652-3578',
        picture: '',
        longitude: '103.8492009',
        latitude: '1.3233667',
    )
  end
end
