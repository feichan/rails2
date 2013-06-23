class GradeType < ActiveRecord::Base
	validates_presence_of :stu_no, :name, :message => "不可为空。"
	has_and_belongs_to_many :student
end
