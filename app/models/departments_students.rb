class DepartmentsStudents < ActiveRecord::Base
	validates_presence_of :department_id, :student_id, :message => "不可为空"
end
