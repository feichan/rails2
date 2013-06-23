# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130622073915) do

  create_table "colleges", :force => true do |t|
    t.string   "name"
    t.string   "profession"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colleges_hospitals", :force => true do |t|
    t.integer  "college_id"
    t.integer  "hospital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grade_types_students", :force => true do |t|
    t.integer  "grade_type_id"
    t.integer  "student_id"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospitals", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "grade"
    t.string   "contact"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zone"
  end

  create_table "members", :force => true do |t|
    t.string   "account"
    t.string   "passwd"
    t.integer  "auth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.integer  "college_id",  :default => 0
    t.integer  "hospital_id", :default => 0
  end

  create_table "students", :force => true do |t|
    t.integer  "stu_no"
    t.string   "name"
    t.string   "sex"
    t.string   "gradation"
    t.string   "college"
    t.string   "profession"
    t.string   "class_name"
    t.string   "grade"
    t.string   "birthday"
    t.string   "politics"
    t.string   "nation"
    t.string   "home"
    t.string   "stu_class"
    t.string   "college_year"
    t.string   "study_year"
    t.string   "incubat_direct"
    t.string   "profession_direct"
    t.string   "inter_date"
    t.string   "email"
    t.string   "identity_no"
    t.string   "profect"
    t.string   "pinyin_name"
    t.integer  "profession_no"
    t.string   "stu_card_no"
    t.string   "phone"
    t.string   "degree"
    t.integer  "trust_college"
    t.string   "proctis_action"
    t.integer  "hospital_id"
    t.string   "coach"
    t.string   "coach_tel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "politics_class"
    t.integer  "college_id"
    t.string   "internship_grade"
    t.string   "hostpital_grade"
  end

end
