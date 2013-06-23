class CollegesDepartments < ActiveRecord::Base
	validates_presence_of :college_id, :department_id, :message => "不可为空"
end
