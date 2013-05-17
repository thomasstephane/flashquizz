class GameTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :cards_correct, :cards_shown
      # t.references :user, :deck
      t.integer :user_id, :deck_id
      
      t.timestamps 
    end
  end
end
