class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.integer :stu_no
      t.string :name
      t.string :sex
      t.string :gradation
      t.string :college
      t.string :profession
      t.string :class_name
      t.string :grade
      t.string :birthday
      t.string :politics
      t.string :nation
      t.string :home
      t.string :stu_class
      t.string :college_year
      t.string :study_year
      t.string :incubat_direct
      t.string :profession_direct
      t.string :inter_date
      t.string :email
      t.string :identity_no
      t.string :profect
      t.string :pinyin_name
      t.integer :profession_no
      t.string :stu_card_no
      t.string :phone
      t.string :degree
      t.integer :trust_college
      t.string :proctis_action
      t.integer :hospital_id
      t.string :coach
      t.string :coach_tel

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
