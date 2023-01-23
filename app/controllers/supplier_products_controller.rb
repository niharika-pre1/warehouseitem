class SupplierProductsController < ApplicationController
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

  private
  def supplier_product_params
      params.require(:supplier_product).permit(:supplier_id, :product_id, :product_quantity)
    end
end
