class ProductsController < ApplicationController

    #check if the user is logged_in before create, and update actions.

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create
        @product = current_user.seller_products.build(product_params)

        if @product.save
            redirect_to  product_path(@product)
        else
            render :new
        end
    end

    def show
        @product = Product.find_by(:id => params[:id])
    end

    def update
    end

    def destroy
    end

    private

    def product_params
        params.require(:product).permit(:title, :product_model, :brand, :storage_capacity, :condition, :color, :description, :quantity, :price)
    end

end
