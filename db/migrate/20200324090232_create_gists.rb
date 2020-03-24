class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.references :user
      t.references :question
      t.string :url

      t.timestamps
    end
  end
end
