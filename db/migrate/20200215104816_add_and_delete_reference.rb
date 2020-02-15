class AddAndDeleteReference < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tests, :categories, index: true
    remove_foreign_key :categories, column: :test_id
  end
end
