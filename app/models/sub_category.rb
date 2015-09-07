class SubCategory < ActiveRecord::Base

	belongs_to :category
	has_many :galleries

	# Validation
	validates :name, presence: true, uniqueness: true
	validates :category_id, presence: true

	# Delegates
	delegate :name, to: :category, prefix: true, allow_nil: true
end
