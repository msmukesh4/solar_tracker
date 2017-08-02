class CreateDeviceData < ActiveRecord::Migration[5.0]
  def change
    create_table :device_data do |t|
      t.references :device, foreign_key: true
      t.string :temprature

      t.timestamps
    end
  end
end
