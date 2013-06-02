class AddHostpitalGradeToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :hostpital_grade, :string
  end

  def self.down
    remove_column :students, :hostpital_grade
  end
end
