class OrdersController < ApplicationController

    before_action :current_cart, :logged_in?, :current_user, :set_cart

    def new
        @order = Order.new
        @order.build_buyer
    end

    def create
        @order = Order.new(order_params)
        @order.cart = current_cart
        @order.buyer = current_user

        if @order.save
            current_cart.cart_products.destroy_all

            redirect_to order_path(@order)
        else
            flash[:danger] = "Something Went wrong. Try logging in again."

            redirect_to carts_path
        end
    end

    def show
        @order = Order.find_by_id(params[:id])
    end


    private

    def order_params
        params.require(:order).permit(:address_field_1, :address_field_2,
         :city, :state, :zipcode, :payment_method, buyer_attributes: [:firstname, 
         :lastname, :username, :email, :password, :password_confirmation])
    end

end
