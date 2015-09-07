class AddRoleIdToUsers < ActiveRecord::Migration
  def up
    change_table(:users) do |t|
      t.belongs_to :role
    end
  end

  def down
    change_table(:users) do |t|
      t.remove :role_id  
    end
  end
end
