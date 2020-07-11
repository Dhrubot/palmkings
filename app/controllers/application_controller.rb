class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in

    def home
        render 'layouts/welcome'
    end


    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def current_cart

        if logged_in?
            @cart = current_user.carts.last 
        else
            if session[:cart_id]
                @cart = Cart.find_by(:id => session[:cart_id])
            else
                @cart = Cart.create
                session[:cart_id] = @cart.id
            end

        end
    end

end
