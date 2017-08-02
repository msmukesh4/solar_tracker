class CreateUserDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :user_devices do |t|
      t.references :user, foreign_key: true
      t.references :device, foreign_key: true
      t.string :status,    :default => "Active"

      t.timestamps
    end
  end
end
