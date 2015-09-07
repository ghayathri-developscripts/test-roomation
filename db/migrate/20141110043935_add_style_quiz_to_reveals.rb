class AddStyleQuizToReveals < ActiveRecord::Migration
  
  def down
  	remove_column :reveals, :style_quiz, :integer
    
  end
end
