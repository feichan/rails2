class Hospital < ActiveRecord::Base
	# validate fields
	validates_presence_of :name, :address, :message => "不可为空"

	has_many :students
	has_many :members
	has_and_belongs_to_many :college
end
