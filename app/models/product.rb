class Product < ApplicationRecord
  belongs_to :seller, :class_name => "User"
  has_many :cart_products
  has_many :carts, through: :cart_products
  has_many :buyer, class_name: "User", through: :order
  
end
