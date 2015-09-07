class AddAssociationForStylePolls < ActiveRecord::Migration

  def change
    add_column :design_requests, :style_poll_id, :integer
  end

end
