class CreateStyleQuizResults < ActiveRecord::Migration
  def change
    create_table :style_quiz_results do |t|
      t.string :name
      t.text :style_description

      t.timestamps
    end

    create_table :color_quiz_results do |t|
      t.string :name
      t.text :color_description
      t.string :color_spectrum

      t.timestamps
    end

    add_column :style_polls, :style_quiz_result_id, :integer
    add_column :style_polls, :color_quiz_result_id, :integer
  end
end
