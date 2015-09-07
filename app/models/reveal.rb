class Reveal < ActiveRecord::Base

  attr_accessible :name, :email ,:from,:style_quiz,:color_quiz

  validates_presence_of :name, :email
  validates :name,  :length => {:minimum => 2, :maximum => 254}, :allow_blank => true
  validates :email, :length => {:minimum => 5, :maximum => 100},
                    :format => {:with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i},
                    :allow_blank => true,
                    :uniqueness => true
  validates :email, confirmation: true, :if => :email_changed?
end
# == Schema Information
#
# Table name: reveals
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  from       :string(255)
#

