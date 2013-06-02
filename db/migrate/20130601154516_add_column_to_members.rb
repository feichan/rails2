class AddColumnToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :hospital_id, :integer, :default => 0
  end

  def self.down
    remove_column :members, :hospital_id
  end
end
