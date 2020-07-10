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

end
