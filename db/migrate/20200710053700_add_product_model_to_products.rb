class AddProductModelToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_model, :string
  end
end
