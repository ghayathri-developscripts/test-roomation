class CreateContactFormEmails < ActiveRecord::Migration
  def change
    create_table :contact_form_emails do |t|
      t.text :message
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
