class AddStepAndFailsToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :fails, :integer
    add_column :cards, :step, :integer
  end
end
