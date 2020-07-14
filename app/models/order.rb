class Order < ApplicationRecord
  belongs_to :buyer, :class_name => "User"
  belongs_to :cart
  accepts_nested_attributes_for :buyer

  validates :address_field_1, :city, :state, :zipcode, presence: true
  
  before_save :downcase_attributes

  private

  def downcase_attributes
        downcaseable = ["address_field_1", "address_field_2", "city", "state"]

        self.attributes.each do |attr, val|
        self.send("#{attr}=",val.to_s.strip.downcase) if downcaseable.include?(attr)
        end
    end

end
