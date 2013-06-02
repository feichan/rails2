class AddCollegeIdToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :college_id, :integer, :default => 0
  end

  def self.down
    remove_column :members, :college_id
  end
end
