class AddCluomnToDepartmentsStudents < ActiveRecord::Migration
  def self.up
    add_column :departments_students, :grade, :string
  end

  def self.down
    remove_column :departments_students, :grade
  end
end
