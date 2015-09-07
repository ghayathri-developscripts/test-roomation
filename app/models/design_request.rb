class DesignRequest < ActiveRecord::Base
  
  STEP_VISUAL_INDEXES = {:level_of_guidance => 1, :style_assessment => 2, :style_assessment_results => 3, :my_room => 4, :my_room_continued => 5, :choose_designer => 6, :registration => 7, :checkout => 8}
  
  belongs_to :customer, :class_name => "User", :foreign_key => "user_id"
  has_many :designers, :class_name => "User",
    :foreign_key => "user_id", :through => :projects
  has_many :projects, :dependent => :destroy
  belongs_to :package
  belongs_to :life_phase
  belongs_to :project_approach
  belongs_to :budget_type
  belongs_to :style_poll
  has_one    :room
  has_one    :transaction
  
  attr_accessible :room_attributes, :style_poll_attributes, :package_id, :life_phase_id, :project_approach_id, 
    :budget_type_id, :budget_explanation, :other_wishes, :step, :user_id, :project_id, :designer_ids, :entered_discount_code

  accepts_nested_attributes_for :room, :style_poll

  state_machine :step, :initial => :init do

    around_transition do |design_request, transition, block|
      design_request.disable_validation
      block.call
      design_request.enable_validation
    end

    state :level_of_guidance do
      validates_presence_of :package_id, :if  => :validation_enabled?
    end
    state :my_room do
      validates_presence_of :life_phase_id, :project_approach_id, :budget_type_id, :budget_explanation, :if  => :validation_enabled?
    end
    state :my_room_continued do
    end
    state :choose_designer do
    end
    state :registration, :checkout do
    end

    event :switch_step do
      transition :init  => :level_of_guidance, :level_of_guidance  => :style_assessment, :style_assessment => :style_assessment_results, :style_assessment_results => :my_room, :my_room => :my_room_continued, 
      :my_room_continued => :choose_designer, :choose_designer => :registration, :registration  => :checkout
    end

  end

  def visual_step_index
    STEP_VISUAL_INDEXES[step_name]
  end
  
  def enable_validation
    @validation_enabled = true
  end

  def disable_validation
    @validation_enabled = false
  end
  
  def validation_enabled?
    enable_validation if @validation_enabled.nil?
    @validation_enabled
  end

  def self.steps
    DesignRequest.new.step_paths.to_states
  end
  
  def design_request_name
    "#{self.id} #{self.room.title if room.present?}"
  end
  
  def package_name
    if package.present?
      package.title
    else 
      "none"
    end
  end

  def find_active_discount
    discount = find_discount
    if discount.present? and package.active_discounts.include?(discount)
      discount
    else
      nil
    end
  end
  
  def total_amount
    @discount = find_active_discount
    if @discount.present?
      return @discount.total_amount(package.price.dollars)
    else
      return package.price.dollars
    end
  end

  private

  def find_discount
    return nil if self.entered_discount_code.nil?
    Discount.where(code: self.entered_discount_code).first
  end
end
# == Schema Information
#
# Table name: design_requests
#
#  id                    :integer         not null, primary key
#  user_id               :integer
#  step                  :string(255)
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  package_id            :integer
#  budget_explanation    :string(255)
#  other_wishes          :text
#  budget_type_id        :integer
#  life_phase_id         :integer
#  project_approach_id   :integer
#  style_poll_id         :integer
#  design_hash           :string(255)
#  entered_discount_code :string(255)
#

