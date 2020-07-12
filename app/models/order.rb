class Order < ApplicationRecord
  belongs_to :buyer, :class_name => "User"
  belongs_to :cart
  accepts_nested_attributes_for :buyer


end
