class Cart < ApplicationRecord

  has_many :orders
  has_many :cart_products
  belongs_to :buyer, :class_name => "User", optional: true
  has_many :products, through: :cart_products
  

  def total
    self.cart_products.collect{|cp| cp.subtotal}.sum
  end

  def add_to_cart(*args)

    if cart_product = self.cart_products.find_by(product: args)  
      cart_product.update_attributes(quantity: args)
      return cart_product 
    else
      self.cart_products.build(product: args.last)
    end
  end

end
