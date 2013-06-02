class Student < ActiveRecord::Base
	# validate fields
	validates_presence_of :stu_no, :name, :message => "不可为空。"
	validates_numericality_of :stu_no, :identity_no, :stu_card_no, :message => "必须为数字。"
	validates_uniqueness_of :stu_no, :message => "不可重复。"

	belongs_to :college
	belongs_to :hospital
end
