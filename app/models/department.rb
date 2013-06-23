class Department < ActiveRecord::Base
	validates_presence_of :name, :message => "不可为空"
	has_and_belongs_to_many :college
end
