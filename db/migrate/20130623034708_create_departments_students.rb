class CreateDepartmentsStudents < ActiveRecord::Migration
  def self.up
    create_table :departments_students do |t|
      t.integer :department_id
      t.integer :student_id

      t.timestamps
    end
  end

  def self.down
    drop_table :departments_students
  end
end
