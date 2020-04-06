class AddColumnTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :successfully_completed, :boolean, default: false
  end
end
