class RemoveProjectDefaultStatus < ActiveRecord::Migration
  def up
    change_column_default :projects, :status, nil
  end

  def down
    change_column_default :projects, :status, "received"
  end
end
