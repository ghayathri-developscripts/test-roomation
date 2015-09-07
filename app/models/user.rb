class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :email_confirmation, :password, :password_confirmation, :remember_me, :first_name, :last_name, :role_id, :is_active, 
    :avatar, :description, :terms_agreement, :photo_album_attributes,:phone

  

  #customer relations
  has_many :design_requests
  has_one  :style_poll
  
  #designer relations
  has_many :projects
  has_many :galleries
  belongs_to :photo_album, dependent: :destroy

  #both
  belongs_to :role

  accepts_nested_attributes_for :photo_album, :allow_destroy => true

  attr_accessor :terms_agreement

  validates_presence_of :first_name
  validates_acceptance_of :terms_agreement
  validates :email, :uniqueness => true, :email => true, :allow_blank => true
  validates :email, confirmation: true, :if => :email_changed?
  #validates_presence_of :email_confirmation, :if => :email_changed?
  #validates_presence_of :email_confirmation, :on => :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  #validates_presence_of :email
  #validates_uniqueness_of :email
  validate :user_should_be_identified

  before_create :set_default_role
after_create :add_to_mailchimp_list
  scope :designers, includes(:role).where(:roles => { :name => "designer"})
  scope :active_designers, designers.where(:is_active => true)
  scope :role_user_with_nil, includes(:role).where("is_active is null or true", :roles => { :name => "user"})
  scope :role_admin_with_true, includes(:role).where(:is_active => true, :roles => { :name => "admin"})
  scope :inactive_designers, designers.where(:is_active => false)
  scope :customers, includes(:role).where(:roles => { :name => "user"})
  scope :admins, includes(:role).where(:roles => { :name => "admin"})



  def set_default_role
    self.role ||= Role.find_by_name("user")
  end

  def user_should_be_identified
    if facebook_id.blank? && twitter_id.blank? && email.blank?
      errors.add :base, 'User should be identified by twitter, facebook or email'
    end
  end

  def full_name
    [first_name, last_name].map(&:capitalize).join(' ')
  end

  def to_s
    full_name
  end

def self.from_omniauth(auth)
 data = auth.extra.raw_info
 
    if user = User.where(:email => data.email).first
      user

      else

  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.first_name = auth["info"]["name"] 
    user.email = auth["info"]["email"] if auth["provider"].eql?("facebook")
    #user.password_confirmation = Devise.friendly_token[0,20]
    user.password = Devise.friendly_token[0,20]
    #user.email_confirmation=auth["info"]["email"] if auth["provider"].eql?("facebook")
  end
end
end
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    #if user = User.where(:facebook_id => data.id.to_i).first
    if user = User.where(:email => data.email).first
      user
    else
      User.create! :email => data.email,
        :password => Devise.friendly_token[0,20],
        :first_name => data.first_name,
        :last_name => data.last_name,
        :facebook_id => data.id.to_i
    end
  end

  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:twitter_id => data.id.to_i).first
      user
    else
      # Twi doesn't provides us user email :( suspended
      User.create! :password => Devise.friendly_token[0,20],
        :first_name => data.name,
        :twitter_id => data.id.to_i
    end
  end

# def send_email
# #   ActionMailer::Base.smtp_settings = {
# #    :address   => "relay.jangosmtp.net",
# #                            :port      => 25,
# #                            :domain    => "http://roomations.com",
# #                            :user_name => "Lakshmi_room",
# #                            :password  => "roomations",
# #                            :authentication => 'plain',
# #                            :enable_starttls_auto => true
# # }
#    UserMailer.welcome(self).deliver

# end


# Mailchimp list
def add_to_mailchimp_list
  @list_id = "82796eb3f5"
      gb = Gibbon::API.new
      gb.lists.subscribe({
          :id => @list_id,
          :email => {:email => self.email},
          :double_optin => false,
          :merge_vars => {:FNAME => "#{self.first_name}", :LNAME => "#{self.last_name}"}
        })
end

  def self.find_for_google_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else
      User.create! :email => data.email,
        :password => Devise.friendly_token[0,20],
        :first_name => data.first_name,
        :last_name => data.last_name
    end
  end

  def is_role? type
    role.name == type.to_s
  end

  def change_state
    self.is_active = !is_active
    save
  end
 def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  phone                  :string(255)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  facebook_id            :integer
#  twitter_id             :integer
#  role_id                :integer
#  is_active              :boolean
#  avatar                 :string(255)
#  description            :text
#  photo_album_id         :integer
#

