class Discount < ActiveRecord::Base

  TYPE_DOLLARS = 1
  TYPE_PERCENT = 2
  AVAILABLE_TYPES = [TYPE_DOLLARS, TYPE_PERCENT]
  TYPES_COLLECTION = [["$", TYPE_DOLLARS], ["%", TYPE_PERCENT]]

  belongs_to :package

  validates_uniqueness_of :code
  validate :validate_dates
  validates_inclusion_of :discount_type, in: AVAILABLE_TYPES

  def validate_dates
    now = Date.today
    errors.add(:expiration_date, "must be not early than now") if expiration_date.present? && expiration_date < now
    errors.add(:expiration_date, "must be not early than start_date") if start_date.present? && expiration_date.present? && expiration_date < start_date
  end

  def expired?
    return false if self.expiration_date.nil?
    return self.expiration_date < DateTime.now
  end

  def started?
    return true if self.start_date.nil?
    return self.start_date <= DateTime.now
  end

  def total_amount(amount)
    return amount if self.amount.nil? || self.amount == 0
    total_amount = 0
    case discount_type
    when TYPE_DOLLARS
      total_amount = amount - self.amount
    when TYPE_PERCENT
      total_amount = amount - amount * self.amount / 100
    end
    return total_amount < 0 ? 0 : total_amount
  end
end
# == Schema Information
#
# Table name: discounts
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  amount          :integer         default(0), not null
#  discount_type   :integer         default(1), not null
#  expiration_date :datetime
#  start_date      :datetime
#  code            :string(255)
#  package_id      :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

