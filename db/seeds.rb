# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.where(email: 'solartracker@admin.com')
if u.blank?
	u = User.create! :first_name => 'Super', :last_name => 'Admin', :email=>'solartracker@admin.com', :password => 'password', :password_confirmation => 'password', :confirmed_at => Time.now, :is_admin => true, :contact_number => '9040357009', :status => 'Active'
else
	u = u.first
end

uuid = SecureRandom.uuid
d = Device.create! uuid:uuid, place: "ranchi", name: "solar pannel 1", model: "slr-1234", device_id: Time.now.getutc.to_i.to_s

DeviceDatum.create! device:d, temperature: {datapoints: [{ timestamp: Time.now.getutc.to_i.to_s, temperature: 100}, { timestamp: Time.now.getutc.to_i.to_s, temperature: 101 } ]}.to_json, humidity: {datapoints: [{ timestamp: Time.now.getutc.to_i.to_s, humidity: 40}, { timestamp: Time.now.getutc.to_i.to_s, humidity: 44} ]}.to_json, solar_pannel: {datapoints: [{ timestamp: Time.now.getutc.to_i.to_s, current: 100, volatge: 200}, { timestamp: Time.now.getutc.to_i.to_s, current: 100, volatge: 200} ]}.to_json, battery: {datapoints: [{ timestamp: Time.now.getutc.to_i.to_s, current: 10, volatge: 20}, { timestamp: Time.now.getutc.to_i.to_s, current: 12, volatge: 22} ]}.to_json

UserDevice.create! user:u, device:d, status: "Active"

# query for
# extracting device data from user
# User.where(:is_admin => true).first.user_device.first.device.device_data.first.temperature