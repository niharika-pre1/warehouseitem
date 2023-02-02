class ShopkeeperProductsController < ApplicationController
  after_action :sub_item,only:[:add_item]
  def index
    @shopkeeper_products = ShopkeeperProduct.all
  end

  def add_item
    shopkeeper = Shopkeeper.first
    @product = Product.find(params[:id])
    @shopkeeper_products = ShopkeeperProduct.pluck(:product_id)

    if @shopkeeper_products.include?(@product.id)
      shopkeeper_product = @product.shopkeeper_products.find_by(product_id: @product.id)
      shopkeeper_product_quantity =shopkeeper_product.product_quantity.to_i
      shopkeeper_product.update(product_quantity: shopkeeper_product_quantity + 1)
      redirect_to shopkeeper_products_path   
    else
      shopkeeper_product = @product.shopkeeper_products.create(shopkeeper_id: shopkeeper.id, product_quantity: 1)
      redirect_to shopkeeper_products_path   
    end
  end

  def sub_item
    @product = Product.find(params[:id])
    wp = WarehouseProduct.find_by(product_id: @product.id)
    
    if wp.product_quantity <= 0
      wp.update(product_quantity: nil)
    else
      wp.update(product_quantity:
      wp.product_quantity - 1)
    end
  end
end