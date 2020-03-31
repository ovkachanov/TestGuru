class AddReferenceKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :tests, :categories
    add_foreign_key :tests, :categories, column: :category_id
  end
end
