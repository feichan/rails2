class AddZoneToHospitals < ActiveRecord::Migration
  def self.up
    add_column :hospitals, :zone, :string
  end

  def self.down
    remove_column :hospitals, :zone
  end
end
