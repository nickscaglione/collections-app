class CreateCardDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :card_decks do |t|
      t.integer :card_id
      t.integer :deck_id
      t.integer :card_count
      
      t.timestamps
    end
  end
end
