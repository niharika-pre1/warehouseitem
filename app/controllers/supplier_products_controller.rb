class SupplierProductsController < ApplicationController
  after_action :sub_item,only:[:add_item]
  def index 
    @supplier_products = SupplierProduct.all
  end

  def new
    @supplier_product = SupplierProduct.new
  end

  def create
    @supplier_product = SupplierProduct.new(supplier_product_params)

    if @supplier_product.save
      redirect_to @supplier_product
    else
      render :new
    end
  end

  def add_item
   warehouse = Warehouse.first
   @supplier_product = SupplierProduct.find(params[:id])
   @warehouse_products = WarehouseProduct.pluck(:supplier_product_id)
   if @warehouse_products.include?(@supplier_product.id)
    @warehouse_product = @supplier_product.warehouse_products.first
    current_quantity = @warehouse_product.product_quantity
    current_quantity = current_quantity.to_i
    @warehouse_product.update(product_quantity:current_quantity + 1)
   else
    @warehouse_product = @supplier_product.warehouse_products.create(warehouse_id: params[:warehouse_id])
       redirect_to warehouse_products_path   
    end
  end
  
  def sub_item
    @supplier_product = SupplierProduct.find(params[:id])
    @supplier_product.decrement!(:product_quantity) 
  end


  private
  def supplier_product_params
      params.require(:supplier_product).permit(:supplier_id, :product_id, :product_quantity)
    end
end
