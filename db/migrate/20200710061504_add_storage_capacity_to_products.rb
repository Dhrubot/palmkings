class AddStorageCapacityToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :storage_capacity, :string
  end
end
