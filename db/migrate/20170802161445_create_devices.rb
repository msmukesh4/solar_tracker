class CreateDevices < ActiveRecord::Migration[5.0]
    def change
        create_table :devices do |t|
            t.string :uuid,      :null => false, :default => ""
            t.string :device_id,  :null => false
            t.string :place
            t.decimal :latitude, :default => 0.0, :precision => 10, :scale => 7
            t.decimal :longitude, :default => 0.0, :precision => 10, :scale => 7
            t.string :name
            t.string :model     # device model name
            t.string :status,    :default => "Active"

            t.timestamps
        end
    end
end
