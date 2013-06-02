class CollegesHospitals < ActiveRecord::Base
	validates_presence_of :college_id, :hospital_id, :message => "不可为空"
end
