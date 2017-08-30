class UsersController < ApplicationController

	def index

		respond_to do |format|
			format.html { }
		end

	end

	def show
		
	end

	def assign_device

		@devices_list = Device.where(:status => "Active").order(:id)
		@observer = User.find(params[:observer_id])
		render "users/admin/assign_device"
	end

end
