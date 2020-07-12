class OrdersController < ApplicationController

    before_action :current_cart, :logged_in?, :redirect_if_not_logged_in, :current_user

    def new
        @order = Order.new
    end

    def create
        @user = current_user
    end


    private

    def order_params
        params.require(:order).permit(:address_field_1, :address_field_2, :city, :state, :zipcode, :payment_method)
    end

end
