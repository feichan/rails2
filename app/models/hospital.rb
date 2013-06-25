class Hospital < ActiveRecord::Base
	# validate fields
	validates_presence_of :name, :address, :message => "不可为空"
	validates_numericality_of :boy_no, :girl_no, :message => "必须为数字"

	has_many :students
	has_many :members
	has_many :students
	has_many :students2, :class_name => "Student", :foreign_key => "hospital_id2"
	has_and_belongs_to_many :college
end
