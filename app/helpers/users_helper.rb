module UsersHelper

	def request_render(user)
		if user.is_admin

			@observer_list = User.where(:is_admin => false, :status => "Active")
			@devices_list = Device.where(:status => "Active")
			render partial: "users/admin/show"

		else

			render partial: "users/observer/show"
		end
	end

end
