class AddColumnsToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :easiness, :float, default: 2.5
  end
end
