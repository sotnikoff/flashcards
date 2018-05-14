class AddIntervalToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :interval, :integer, default: 1, null: false
  end
end
