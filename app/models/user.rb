class User < ApplicationRecord
    has_secure_password

    has_many :carts, class_name: "Cart", foreign_key: "buyer_id"
    has_many :seller_products, class_name: "Product", foreign_key: "seller_id"
    has_many :buyer_orders, class_name: "Order", foreign_key: "buyer_id"
    has_many :ordered_carts, through: :carts

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true



    def self.from_google(auth)
        where(email: auth.info.email).first_or_initialize do |user| # initalizes the user with the 'new' method. doesn't save it.
            user.firstname = auth.info.first_name
            user.lastname = auth.info.last_name
            user.username = auth.info.name.split.join('.')
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end

    def self.from_facebook(auth)
        where(email: auth.info.email).first_or_initialize do |user|
            user.firstname = auth.info.name.split[0]
            user.lastname = auth.info.name.split[1]
            user.username = auth.info.name.split.join('.')
            user.email = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end
