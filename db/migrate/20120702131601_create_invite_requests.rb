class CreateInviteRequests < ActiveRecord::Migration
  def change
    create_table :invite_requests do |t|
      t.string :email
      t.string :name
      t.string :portfolio_web
      t.string :portfolio
      t.string :resume_web
      t.string :resume

      t.timestamps 
    end
  end
end
