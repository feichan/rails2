class College < ActiveRecord::Base
	has_many :students
	has_many :members
	has_and_belongs_to_many :hospital
	has_and_belongs_to_many :department

	def self.parents
		self.find_all_by_parent_id(0)
	end

	def self.professions(college_id)
		self.find_all_by_parent_id(college_id)
	end
end
