class ProductsController < ApplicationController
    
    # before_action :logged_in?, :current_user, :redirect_if_not_logged_in, except: [:index, :show]

    def index
        if params[:user_id] && user = User.find_by(id: params[:user_id])
            @products = user.seller_products
        else
        @products = Product.all
        end
    end

    def new
        if params[:user_id]
            @product = current_user.seller_products.build
        else
            @product = Product.new
        end
    end

    def create
        @product = current_user.seller_products.build(product_params)

        if @product.save
            redirect_to  product_path(@product)
        else
            render :new_user_product_path
        end
    end

    def show
        @product = Product.find_by_id(params[:id])
    end

    def edit
        @product = Product.find_by_id(params[:id])
    end

    def update
        @product = Product.find_by_id(params[:id])
        @product.update(product_params)
        redirect_to product_path(@product)
    end

    def destroy
        @product = Product.find_by_id(params[:id])
        @product.destroy
        redirect_to products_path
    end

    private

    def product_params
        params.require(:product).permit(:title, :product_model, :brand, :storage_capacity, :condition, :color, :description, :quantity, :price)
    end

end
