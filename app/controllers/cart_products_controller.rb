class CartProductsController < ApplicationController

    def index
        @cart_products = CartProduct.all
    end

    def new
        @cart_product = CartProduct.new
        @cart_product.cart = current_cart
    end

    def create
        @cart = current_cart
        product = Product.find_by_id(params[:product_id])
        @cart_product = @cart.cart_products.build(product: product)

        if @cart_product.save
            redirect_to cart_products_path
        else
            flash[:danger] = "Something went wrong."
            render :index
        end
    end

    def show
        @cart_product = CartProduct.find_by_id(params[:id])
    end

    def edit
    end

    def destroy
        @cart_product = CartProduct.find_by_id(params[:id])
        @cart_product.destroy

        redirect_to cart_products_path
    end
end
