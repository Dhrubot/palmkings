class Cart < ApplicationRecord
  has_many :orders
  has_many :cart_products
  belongs_to :user
  has_many :products, through: :cart_products
end
