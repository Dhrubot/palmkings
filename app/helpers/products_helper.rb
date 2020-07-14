module ProductsHelper

    def product_count(product, cart)
        if product.quantity == 0
            "Sold Out"
        else
            "#{product.quantity - cart.quantity} more available"
        end
    end

    def select_quantity(product)
        (1..product.quantity).to_a
    end

end
