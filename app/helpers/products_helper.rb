module ProductsHelper

    def product_count(product, cart_product)
        if cart_product.quantity > product.quantity
            "Sold Out"
        else
            "#{product.quantity - cart_product.quantity} more available"
        end
    end

    def select_quantity(product)
        (1..product.quantity).to_a
    end

    def cart_name(p)
        "#{p.brand} #{p.product_model}".titleize
    end

end
