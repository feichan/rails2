class Student < ActiveRecord::Base
	attr_accessor :grade_1, :grade_2, :grade_3, :grade_4, :grade_5,
								:grade_1_no, :grade_2_no, :grade_3_no, :grade_4_no, :grade_5_no
	# validate fields
	validates_presence_of :stu_no, :name, :message => "不可为空。"
	validates_numericality_of :stu_no, :identity_no, :stu_card_no, :message => "必须为数字。"
	validates_uniqueness_of :stu_no, :message => "不可重复。"

	belongs_to :college
	belongs_to :profession, :class_name => "College", :foreign_key => "profession"
	belongs_to :hospital
	belongs_to :hospital_2, :class_name => "Hospital", :foreign_key => "hospital_id2"
	has_and_belongs_to_many :grade_type

	after_update :add_grade_types_students

	def add_grade_types_students
		exsits = GradeTypesStudents.find(:all, :conditions => ['student_id = ?', id])
		exsits.each do |exs|
			exs.destroy
		end
		GradeTypesStudents.create!(:grade_type_id => grade_1, :student_id => id, :grade => grade_1_no)
		GradeTypesStudents.create!(:grade_type_id => grade_2, :student_id => id, :grade => grade_2_no)
		GradeTypesStudents.create!(:grade_type_id => grade_3, :student_id => id, :grade => grade_3_no)
		GradeTypesStudents.create!(:grade_type_id => grade_4, :student_id => id, :grade => grade_4_no)
		GradeTypesStudents.create!(:grade_type_id => grade_5, :student_id => id, :grade => grade_5_no)
	end
end
