class AddColumnToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :internship_grade, :string
  end

  def self.down
    remove_column :students, :internship_grade
  end
end
