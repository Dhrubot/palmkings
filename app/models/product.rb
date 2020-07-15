class Product < ApplicationRecord
  belongs_to :seller, :class_name => "User"
  has_many :cart_products
  has_many :carts, through: :cart_products
  has_many :buyer, class_name: "User", through: :order
  has_many :orders, through: :carts, source: "orders"

  has_one_attached :image

  validates :title, :brand, :condition, :color, :quantity, :price, presence: true

  before_save :downcase_attributes

  scope :by_brand, -> (brand) { where("brand = ?", brand) }
  scope :trending, -> { joins(:cart_products).order("cart_products.quantity DESC").limit(8) }
  scope :latest, -> { order("created_at DESC").limit(8) }

  def thumbnail
    @thumbnail = self.image.variant(resize_to_fit: [100, 100])
  end

  def s_image
    @image = self.image.variant(resize_to_fit: [300, 300])
  end

  def available
    self.quantity - self.sold #### need to check in with this
  end

  private

  def self.brands
    Product.all.collect(&:brand).uniq
  end

  def inventory(quantity)
    if self.quantity < 1
      self.destroy
    else
      self.quantity - quantity
    end
  end

  def downcase_attributes
    downcaseable = ["title", "brand", "condition", "color"]

    self.attributes.each do |attr, val|
      self.send("#{attr}=",val.to_s.strip.downcase) if downcaseable.include?(attr)
    end
  end
  
end


