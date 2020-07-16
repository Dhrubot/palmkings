class CartsController < ApplicationController

     before_action :current_cart, :logged_in?, :current_user

    def new
        @cart = Cart.new
    end

    def create
        if current_user
            @cart = current_user.carts.build
        else
            @cart = current_cart
        end

        if @cart.save
            redirect_to cart_path(@cart)
        else
            redirect_to root_path
        end
    end

    def show
        @cart = current_cart
        @cart_products = @cart.cart_products
    end

end
