class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :title
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
