class AddRequiredFieldsToCards < ActiveRecord::Migration[5.1]
  def change
    change_column_null :cards, :original_text, false
    change_column_null :cards, :translated_text, false
    change_column_null :cards, :review_date, false
  end
end
