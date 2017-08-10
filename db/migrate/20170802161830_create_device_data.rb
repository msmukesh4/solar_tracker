class CreateDeviceData < ActiveRecord::Migration[5.0]
  def change
    create_table :device_data do |t|
      	t.references :device, foreign_key: true
      	t.string :temperature
      	t.string :humidity
      	t.string :solar_pannel
      	t.string :battery

      	t.timestamps
    end
  end
end
