class DeviceDatum < ApplicationRecord
  belongs_to :device

	# extract all the records created today
	def self.today
    	where("created_at >= ?", Time.zone.now.beginning_of_day)
  	end

end
