class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags
end
# == Schema Information
#
# Table name: tags
#
#  id         :integer         not null, primary key
#  type       :string(255)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

