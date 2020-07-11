class CartProduct < ApplicationRecord

  belongs_to :product
  belongs_to :cart

  def subtotal
      self.product.price * self.quantity
  end


end
