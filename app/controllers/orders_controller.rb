class OrdersController < ApplicationController

    before_action :current_cart, :logged_in?, :current_user, :set_cart

    def new
        @order = Order.new
        @order.build_buyer
    end

    def create
        @order = Order.new(order_params)
        @order.cart = current_cart
        if current_user
            @order.buyer = current_user
        else
            @user = @order.build_buyer(order_params[:buyer_attributes])
            @user.save
            current_user = @user
            session[:user_id] = @user.id
            @order.buyer = current_user
        end

        if @order.save
            # do a product inventory update
            
            session.delete(:cart_id)
            current_cart
            set_cart

            redirect_to order_path(@order)
        else

            render :new
        end
    end

    def show
        @order = Order.find_by_id(params[:id])

        @buyer = @order.buyer
    end


    private

    def order_params
        params.require(:order).permit(:address_field_1, :address_field_2,
         :city, :state, :zipcode, :payment_method, buyer_attributes: [:firstname, 
         :lastname, :username, :email, :password, :password_confirmation])
    end

end
