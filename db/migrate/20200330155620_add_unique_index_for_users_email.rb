class AddUniqueIndexForUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
    add_index :tests, [:title, :level], unique: true
  end
end
