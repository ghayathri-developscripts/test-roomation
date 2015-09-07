class Project < ActiveRecord::Base

  belongs_to :designer, :class_name => "User", :foreign_key => "user_id"
  belongs_to :design_request

  after_create :set_received_status

  state_machine :status, :initial => :init do
    
    event :receive do
      transition :init  => :received
    end
    
    event :confirm do
      transition :received  => :confirmed
    end
    
    event :start do
      transition :confirmed  => :in_progress
    end
    
    event :finish do
      transition :in_progress => :finished
    end

  end

  def self.statuses
    Project.new.status_paths.to_states
  end
  
  private
  
  def set_received_status
    self.receive
  end

end
# == Schema Information
#
# Table name: projects
#
#  id                :integer         not null, primary key
#  user_id           :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  status            :string(255)
#  design_request_id :integer
#

