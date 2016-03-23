class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
