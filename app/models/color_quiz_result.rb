class ColorQuizResult < ActiveRecord::Base
  mount_uploader :color_spectrum, QuestionPhotoUploader

  has_one :style_poll
end
# == Schema Information
#
# Table name: color_quiz_results
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  color_description :text
#  color_spectrum    :string(255)
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

