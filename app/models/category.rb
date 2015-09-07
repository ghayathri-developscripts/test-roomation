class Category < ActiveRecord::Base

	# Association
	has_many :sub_categories
	has_many :galleries

	# Validation
	validates :name , presence: true, uniqueness: true

	# Delegates
	delegate :name, to: :sub_categories, prefix: true, allow_nil: true
end
