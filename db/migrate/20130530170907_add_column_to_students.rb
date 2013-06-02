class AddColumnToStudents < ActiveRecord::Migration
  def self.up
    add_column :students, :politics_class, :string
  end

  def self.down
    remove_column :students, :politics_class
  end
end
