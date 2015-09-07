class RoomType < ActiveRecord::Base
 
 # Association
	belongs_to :plan
 
 # Validation
 	validates :name, presence: true, uniqueness: true
 	validates :plan_id, presence: true

end
