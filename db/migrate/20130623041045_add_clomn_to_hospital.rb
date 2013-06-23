class AddClomnToHospital < ActiveRecord::Migration
  def self.up
    add_column :hospitals, :boy_no, :integer, :default => 0
    add_column :hospitals, :girl_no, :integer, :default => 0
  end

  def self.down
    remove_column :hospitals, :girl_no
    remove_column :hospitals, :boy_no
  end
end
