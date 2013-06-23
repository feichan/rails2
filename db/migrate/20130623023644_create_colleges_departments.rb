class CreateCollegesDepartments < ActiveRecord::Migration
  def self.up
    create_table :colleges_departments do |t|
      t.integer :college_id
      t.integer :department_id

      t.timestamps
    end
  end

  def self.down
    drop_table :colleges_departments
  end
end
