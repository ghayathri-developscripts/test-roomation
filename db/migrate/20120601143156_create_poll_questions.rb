class CreatePollQuestions < ActiveRecord::Migration
  def change
    create_table :poll_questions do |t|
      t.references :style_poll
      t.references :question

      t.timestamps
    end

    add_index :poll_questions, :style_poll_id
    add_index :poll_questions, :question_id
    add_index :poll_questions, [:style_poll_id, :question_id], unique: true
  end
end
