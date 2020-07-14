module CartProductsHelper

    def select_quantity(cart)
        (1..cart.product.quantity).to_a
    end
    
end
