class Plan < ActiveRecord::Base

	# Validation
	validates :name, presence: true, uniqueness: true

	# Association
	has_many :room_types
end
