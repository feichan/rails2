class CreateCollegesHospitals < ActiveRecord::Migration
  def self.up
    create_table :colleges_hospitals do |t|
      t.integer :college_id
      t.integer :hospital_id

      t.timestamps
    end
  end

  def self.down
    drop_table :colleges_hospitals
  end
end
