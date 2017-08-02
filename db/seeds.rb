# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! :first_name => 'Super', :last_name => 'Admin', :email=>'solartracker@admin.com', :password => 'password', :password_confirmation => 'password', :confirmed_at => Time.now, :contact_number => '9040357009', :status => 'Active'

Device.create! uuid:m, place: "ranchi", name: "solar pannel 1", model: "slr-1234"

DeviceDatum.create! device:d, temprature: "101.12"

UserDevice.create! user:u, device:d, status: "Active"