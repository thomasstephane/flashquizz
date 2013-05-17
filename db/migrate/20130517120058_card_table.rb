class CardTable < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, :answer, :choice2, :choice3, :choice4

      t.integer :deck_id
      # t.references :deck
    end
  end
end
