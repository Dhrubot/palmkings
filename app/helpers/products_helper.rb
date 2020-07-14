module ProductsHelper

    def product_count(product, cart)
        if product.quantity == 1
            "Last Item"
        else
            "#{product.quantity - cart.quantity} more available"
        end
    end

end
