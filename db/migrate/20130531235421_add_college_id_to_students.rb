class AddCollegeIdToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :college_id, :integer
  end

  def self.down
    remove_column :students, :college_id
  end
end
