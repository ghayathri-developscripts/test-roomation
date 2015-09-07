class StyleQuizResult < ActiveRecord::Base
  has_one :style_poll
end
# == Schema Information
#
# Table name: style_quiz_results
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  style_description :text
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

