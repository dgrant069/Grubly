# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:username => "Admin", :email => "admin@example.com", :password => "password",
  :password_confirmation => "password", :role => "admin")

User.create(:username => "Owner1", :email => "owner1@example.com", :password => "password",
  :password_confirmation => "password", :role => "owner")

User.create(:username => "Owner2", :email => "owner2@example.com", :password => "password",
  :password_confirmation => "password", :role => "owner")

Restaurant.create(:name => "Metropolitan Grill", :address => "700 Stewart St, Seattle, WA 98000",
  :category => "American", :phone_number => "206-555-4646", :website => "www.metropolitangrill.com")

Restaurant.create(:name => "The Triple Door", :address => "315 James St, Seattle, WA 98000",
  :category => "Thai", :phone_number => "206-555-6464", :website => "www.thetripledoor.com")
