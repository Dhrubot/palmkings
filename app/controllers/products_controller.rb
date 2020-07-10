class ProductsController < ApplicationController

    #check if the user is logged_in before create, and update actions.

    def index
    end

    def new
        @product = Product.new
    end

    def create
        raise params.inspect
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def product_params
        params.require(:product).permit(:title, :proudct_model, :brand, :storage_capacity, :condition, :color, :description, :quantity, :price)
    end

end
