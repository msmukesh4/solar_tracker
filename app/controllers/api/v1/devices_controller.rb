require 'json'
class Api::V1::DevicesController < ApplicationController

	skip_before_action :verify_authenticity_token, :only => :save_data, if: :json_request?

	def save_data

		render :json => {"status": "device found and data updated"}

		DeviceDatum.create! device_id:1, temperature: params[:data]

		# datapoints
		# u.user_device.first.device.device_data.first.humidity
		
		# if params[:access_token]
		# 	d = Device.where(access_token: params[:access_token]).first
		# 	if d
		# 		# now device is found and we are ready to save data
		# 		device_data = d.device_data.today

		# 		d = {
		# 				id: device_data.last.id.to_s+"_1",
		# 				timestamp: Time.now.getutc.to_i.to_s, 
		# 				temprature: params[:temprature]
		# 			}

		# 		# so today a row is already created 
		# 		# now we need to append the data
		# 		if !device_data.empty?
		# 			device_temperature = device_data.last.temprature

		# 			# construct json data
		# 			# data = {data: [{
		# 			# 			id: device_data.id+"_1", 
		# 			# 			timestamp: Time.now.getutc.to_i.to_s, 
		# 			# 			temperature: 
		# 			# 		}]
		# 			# }

		# 			json_data = JSON.parse(device_temperature)
		# 			json_data["data"] << d

		# 			device_data.last.temprature = json_data
		# 			device_data.last.save

		# 			render :json => {"status": "device found and data updated"}
		# 		else
		# 			# no rows created today so create one
		# 			data = {data: [d]}.to_json
		# 			DeviceDatum.create! device:d, temprature: data
		# 			render :json => {"status": "device found and data updated"}
		# 		end
		# 	else
		# 		head 403
		# 	end
		# else
		# 	head 401
		# end
	end

end