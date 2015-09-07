class Role < ActiveRecord::Base
  has_many :users

  class << self
    %w(admin user designer).each do |role|
      define_method role do
        find_by_name(role)
      end
    end
  end
end

# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

