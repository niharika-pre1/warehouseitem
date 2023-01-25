class WarehouseProductsController < ApplicationController
  after_action :sub_item,only:[:add_item]
  def index
  @warehouse_products = WarehouseProduct.all
  end

  def add_item
   shopkeeper = Shopkeeper.first
   @warehouse_product = WarehouseProduct.find(params[:id])
   @shopkeeper_products = ShopkeeperProduct.pluck(:warehouse_product_id)
   if @shopkeeper_products.include?(@warehouse_product.id)
    @shopkeeper_product = @warehouse_product.shopkeeper_products.first
    current_quantity = @shopkeeper_product.product_quantity
    current_quantity = current_quantity.to_i
    @shopkeeper_product.update(product_quantity:current_quantity + 1)
   else
    @shopkeeper_product = @warehouse_product.shopkeeper_products.create(shopkeeper_id: params[:shopkeeper_id])
       redirect_to shopkeeper_products_path   
    end
  end

  def sub_item
    @warehouse_product = WarehouseProduct.find(params[:id])
    @warehouse_product.decrement!(:product_quantity)
    if @warehouse_product.product_quantity == 0
      @warehouse_product.product_id = nil
    end
  end
  
end
