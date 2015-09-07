class ContactFormEmail < ActiveRecord::Base

  validates_presence_of :message, :first_name
  validates :email, :presence => true, 
                    :length => {:maximum => 254},
                    :format => {:with => /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/}
end
# == Schema Information
#
# Table name: contact_form_emails
#
#  id         :integer         not null, primary key
#  message    :text
#  email      :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

