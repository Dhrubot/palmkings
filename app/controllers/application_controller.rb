class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in, :current_cart

    def home
        @latest_products = Product.latest
        @trending_products = Product.trending
        @brands = Product.all.collect(&:brand).uniq
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
        
        if session[:cart_id]
            @cart = Cart.find_or_create_by(:id => session[:cart_id])
        else
            @cart = Cart.new
            @cart.save
            session[:cart_id] = @cart.id
        end
    end

    def set_cart
        current_cart.buyer = current_user if current_user
    end

end
