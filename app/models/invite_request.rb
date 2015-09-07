class InviteRequest < ActiveRecord::Base
  mount_uploader :portfolio, InviteRequestUploader
  mount_uploader :resume, InviteRequestUploader

  attr_accessible :name, :email, :portfolio_web, :portfolio, :portfolio_cache, :resume_web, :resume, :resume_cache

  validates :name,  :length => {:minimum => 2, :maximum => 254}, :allow_blank => true
  validates :email, :length => {:minimum => 5, :maximum => 100},
    :format => {:with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i},
    :allow_blank => true
  
 
  validates_presence_of :name, :email
  validates_presence_of :portfolio, :if => "portfolio_web.blank? && portfolio_cache.blank?", :message => "-- either portfolio file or portfolio url must be set"
  validates_presence_of :resume, :if => "resume_web.blank? && resume_cache.blank?", :message => "-- either resume file or resume url must be set"

  validates_format_of :portfolio_web, :with => URI::regexp(%w(http https)), :if => "portfolio_web.present?"
  validates_format_of :resume_web, :with => URI::regexp(%w(http https)), :if => "resume_web.present?"
end
# == Schema Information
#
# Table name: invite_requests
#
#  id            :integer         not null, primary key
#  email         :string(255)
#  name          :string(255)
#  portfolio_web :string(255)
#  portfolio     :string(255)
#  resume_web    :string(255)
#  resume        :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

