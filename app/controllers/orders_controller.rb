class OrdersController < ApplicationController

    before_action :current_cart, :logged_in?, :redirect_if_not_logged_in, :current_user, :set_cart

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        @order.cart = current_cart
        @order.buyer = current_user

        if @order.save
            redirect_to order_path(@order)
        else
            flash[:danger] = "Something Went wrong. Try logging in again."
        end
    end

    def show
    end


    private

    def order_params
        params.require(:order).permit(:address_field_1, :address_field_2, :city, :state, :zipcode, :payment_method)
    end

end
