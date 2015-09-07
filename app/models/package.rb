class Package < ActiveRecord::Base

  has_many :design_requests

  has_many :discounts

  monetize :price_cents

  def package_summary
    benefits.gsub(',', '<br />')
  end

  def active_discounts
    available_discounts = discounts + Discount.where("package_id IS NULL")
    available_discounts.reject! do |discount|
      discount.expired? || !discount.started?
    end
    available_discounts
  end
  
end

# == Schema Information
#
# Table name: packages
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  price_cents :integer         default(0), not null
#  code        :string(255)
#  benefits    :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

