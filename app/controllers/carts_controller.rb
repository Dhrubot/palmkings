class CartsController < ApplicationController

     before_action :current_cart

    def show
        @cart = current_cart
    end

end
