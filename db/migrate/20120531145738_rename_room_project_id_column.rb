class RenameRoomProjectIdColumn < ActiveRecord::Migration
  def change
    rename_column :rooms, :project_id, :design_request_id
  end
end
