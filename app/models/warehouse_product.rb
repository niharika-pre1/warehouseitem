class WarehouseProduct < ApplicationRecord
	belongs_to :warehouse,optional: true
	belongs_to :product,optional: true

  def total_price
    shopkeeper_product = ShopkeeperProduct.find_by(product_id: product.id)
    quantity = shopkeeper_product&.product_quantity || 0
    product.price * quantity + extended_price * quantity
  end
  
  def sold_product
    shopkeeper_product = ShopkeeperProduct.find_by(product_id: product.id)
    quantity = shopkeeper_product&.product_quantity || 0
  end
  
  def profit_percentage
    shopkeeper_product = ShopkeeperProduct.find_by(product_id: product.id)
    quantity = shopkeeper_product&.product_quantity || 0
    if quantity > 0
    extended_price * 100 /product.price 
    else
    profit_percentage = 0
    end
  end

  def profit
    shopkeeper_product = ShopkeeperProduct.find_by(product_id: product.id)
    quantity = shopkeeper_product&.product_quantity || 0
    extended_price * quantity
  end
end
