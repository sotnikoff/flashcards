class AddDeckToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :deck, foreign_key: true
  end
end
