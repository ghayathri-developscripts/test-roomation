class AddQuizDetailsToReveals < ActiveRecord::Migration
  def change
    add_column :reveals, :style_quiz, :string

    add_column :reveals, :color_quiz, :string

  end
end
