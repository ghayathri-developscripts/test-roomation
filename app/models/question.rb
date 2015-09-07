class Question < ActiveRecord::Base
  mount_uploader :photo, QuestionPhotoUploader

  has_many :poll_questions
  has_many :style_polls, through: :poll_questions

  has_many :question_tags
  has_many :tags, through: :question_tags

  validates_presence_of :photo, :group_id

end
# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  photo      :string(255)     not null
#  group_id   :integer         not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

