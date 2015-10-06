# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


 test = User.new(
   name:     'test User',
   email:    'test@example.com',
   password: 'helloworld',
 )
 test.skip_confirmation!
 test.save!

 users = User.all

10.times do
Apps = App.create!(
     name: Faker::Lorem.sentence,
     url: Faker::Lorem.sentence,
     )
end

Apps = App.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{App.count} apps created"