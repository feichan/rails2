class CreateGradeTypesStudents < ActiveRecord::Migration
  def self.up
    create_table :grade_types_students do |t|
      t.integer :grade_type_id
      t.integer :student_id
      t.string :grade

      t.timestamps
    end
  end

  def self.down
    drop_table :grade_types_students
  end
end
