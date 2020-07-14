class CartsController < ApplicationController

     before_action :current_cart

    def index
        @cart = Cart.new
    end

    def show
        @cart = current_cart
        @cart_products = @cart.cart_products
    end

end
