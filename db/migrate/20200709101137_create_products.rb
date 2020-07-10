class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :brand
      t.string :condition
      t.string :color
      t.string :description
      t.integer :quantity
      t.integer :price
      t.belongs_to :seller, null: false

      t.timestamps
    end
  end
end
