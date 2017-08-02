class Device < ApplicationRecord
	has_many :device_data
	has_many :user_device

end
