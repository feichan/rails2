class GradeTypesStudents < ActiveRecord::Base
	validates_presence_of :grade_type_id, :student_id, :message => "不可为空"
end
