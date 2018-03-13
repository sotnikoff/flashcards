class AddTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :github_token, :string, unique: true
  end
end
