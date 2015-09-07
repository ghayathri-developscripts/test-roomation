class QuestionTag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
end
# == Schema Information
#
# Table name: question_tags
#
#  id          :integer         not null, primary key
#  question_id :integer
#  tag_id      :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

