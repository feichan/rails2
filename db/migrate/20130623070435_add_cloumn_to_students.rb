class AddCloumnToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :hospital_id2, :integer
  end

  def self.down
    remove_column :students, :hospital_id2
  end
end
