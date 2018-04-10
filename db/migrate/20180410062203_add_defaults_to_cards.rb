class AddDefaultsToCards < ActiveRecord::Migration[5.1]
  def change
    change_column :cards, :step, :integer, default: 0
    change_column :cards, :fails, :integer, default: 0
  end
end
