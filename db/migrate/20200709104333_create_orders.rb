class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :address_field_1
      t.string :address_field_2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :payment_method
      t.belongs_to :buyer, null: false
      t.belongs_to :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
