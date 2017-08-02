class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.string :uuid,      :null => false, :default => ""
      t.string :place
      t.string :name
      t.string :model     # device model name
      t.string :status,    :default => "Active"

      t.timestamps
    end
  end
end
