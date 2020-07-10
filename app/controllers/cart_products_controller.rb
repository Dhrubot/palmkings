class CartProductsController < ApplicationController

    def index
        @cart_products = CartProducts.all
    end

    def new
        @cart_products = CartProducts.new
    end

    def create
        raise params.inspect
    end

    def show
    end

    def edit
    end

    def destroy
    end
end
