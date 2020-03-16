class AddNameAndTypeAttrubuteToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_column :users, :last_name, :string
    change_column :users, :name, :string, :null => true
    rename_column :users, :name, :first_name
    add_index :users, :type
  end
end
