class CreateGradeTypes < ActiveRecord::Migration
  def self.up
    create_table :grade_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :grade_types
  end
end
