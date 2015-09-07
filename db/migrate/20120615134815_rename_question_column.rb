class RenameQuestionColumn < ActiveRecord::Migration
  def change
    rename_column :questions, :group, :group_id
  end
end
