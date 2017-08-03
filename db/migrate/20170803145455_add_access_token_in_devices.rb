class AddAccessTokenInDevices < ActiveRecord::Migration[5.0]
  	def change
  		add_column :devices, :access_token, :string, null: false
  	end
end
