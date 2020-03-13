class AddUsersUniqToEmail < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :email, :string, uniqueness: true
  end
end
