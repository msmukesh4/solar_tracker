class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
	
	has_many :devices, :through => :user_devices
	has_many :user_devices

	def fullname
    	full_name = ""
    	if self.first_name && self.last_name
    		full_name = self.first_name.concat(" ") + self.last_name
    	elsif self.first_name && !self.last_name
    		full_name = self.first_name
    	elsif !self.first_name && self.last_name
    		full_name = self.last_name
    	else
    		full_name = "Guest User"
    	end
    	
    	full_name
    end

end
