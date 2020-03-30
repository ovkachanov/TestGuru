class AddReferenceKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tests, :categories
  end
end
