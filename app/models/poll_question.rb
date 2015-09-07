class PollQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :style_poll
end
# == Schema Information
#
# Table name: poll_questions
#
#  id            :integer         not null, primary key
#  style_poll_id :integer
#  question_id   :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

