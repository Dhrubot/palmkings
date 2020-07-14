class Product < ApplicationRecord
  belongs_to :seller, :class_name => "User"
  has_many :cart_products
  has_many :carts, through: :cart_products
  has_many :buyer, class_name: "User", through: :order
  has_one_attached :image

  def thumbnail
    @thumbnail = self.image.variant(resize_to_fit: [100, 100])
  end

  def s_image
    @image = self.image.variant(resize_to_fit: [300, 300])
  end

  def available
    self.quantity - self.sold
  end

  private

  def destroy
    self.destroy if self.quantity < 1
  end
  
end


