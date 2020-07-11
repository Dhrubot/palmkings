class Cart < ApplicationRecord

  has_many :orders
  has_many :cart_products
  belongs_to :user, optional: true
  has_many :products, through: :cart_products

  # def self.add_products(product)
    
  #   product = products.where("product_id = ?", product_id).first

  #   if product && CartProduct.product(product)
  #     CartProduct.quantity + 1
  #     self.save
  #   else
  #     self.products = CartProduct.new(:cart_id => self.id, :product_id => product.id, :quantity => 1)
  #   end
  #   self.save
  # end

  def total
    self.cart_products.collect{|cp| cp.subtotal}.sum
  end

end
