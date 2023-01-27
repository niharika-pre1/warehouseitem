class WarehouseProductsController < ApplicationController
  after_action :sub_item,only:[:add_item]
  def index
  @warehouse_products = WarehouseProduct.all
  end

  def add_item
    warehouse = Warehouse.first
    @product = Product.find(params[:id])
    @warehouse_products = WarehouseProduct.pluck(:product_id)
    if @warehouse_products.include?(@product.id)
     warehouse_product = @product.warehouse_products.find_by(product_id: @product.id)
     warehouse_product_quantity = warehouse_product.product_quantity
     warehouse_product.update(product_quantity: warehouse_product_quantity + 1)
    else
     warehouse_product = @product.warehouse_products.create(warehouse_id: warehouse.id, product_quantity: 1)
     redirect_to warehouse_products_path   
     end
   end

  def sub_item
    @product = Product.find(params[:id])
    sp = SupplierProduct.find_by(product_id: @product.id)
    if sp.product_quantity <= 0
      sp.update(product_quantity: nil)
    else
      sp.update(product_quantity: 
      sp.product_quantity - 1)
    end
  end
  
end
