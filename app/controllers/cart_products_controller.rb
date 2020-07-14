class CartProductsController < ApplicationController
     before_action :current_cart

    def index
        @cart_products = CartProduct.all
        @cart = current_cart
    end

    def new
        @cart_product = CartProduct.new
    end

    def create
        product = Product.find_by_id(params[:cart_product][:product_id])
        # @cart_product = current_cart.cart_products.build(cart_products_params)
        @cart_product = current_cart.add_to_cart(product)
        @cart_product.update(cart_products_params)
        
        redirect_to cart_path(current_cart)
    end

    def show
        @cart_product = CartProduct.find_by_id(params[:id])
    end

    def edit
        @cart_product = CartProduct.find_by_id(params[:id])
    end

    def update
        # @cart_product = CartProduct.find_by_id(params[:id])
        # @cart_product.quantity = params[:cart_product][:quantity]
        
        # if @cart_product.save

        #     redirect_to cart_products_path
        # else
        #     render :index
        # end

        @cart_product = current_cart.cart_products.find_by_id(params[:id])
        @cart_product.update(cart_products_params)

        redirect_to cart_path(current_cart)
    end

    def destroy
        @cart_product = CartProduct.find_by_id(params[:id])
        @cart_product.destroy

        redirect_to cart_path(current_cart)
    end

    private

    def cart_products_params
        params.require(:cart_product).permit(:quantity, :product_id)
    end

end
