class Hospital < ActiveRecord::Base
	# validate fields
	validates_presence_of :name, :address, :message => "不可为空"
	validates_numericality_of :boy_no, :girl_no, :message => "必须为数字"

	has_many :students
	has_many :members
	has_many :students
	has_and_belongs_to_many :college
end
