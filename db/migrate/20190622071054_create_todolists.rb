class CreateTodolists < ActiveRecord::Migration[5.2]
  def change
    create_table :todolists do |t|
      t.string :title
      t.text :description
      t.integer :pincode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
