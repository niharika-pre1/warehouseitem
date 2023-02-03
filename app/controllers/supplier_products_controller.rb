class SupplierProductsController < ApplicationController
  def index 
    @supplier_products = SupplierProduct.all
  end

  def add_item
    supplier = Supplier.first
    @product = Product.find(params[:id])
    @supplier_products = SupplierProduct.pluck(:product_id)

    if @supplier_products.include?(@product.id)
      supplier_product = @product.supplier_products.find_by(product_id: @product.id)
      supplier_product_quantity =supplier_product.product_quantity.to_i
      supplier_product.update(product_quantity: supplier_product_quantity + 1)
      redirect_to supplier_products_path
    else
      supplier_product = @product.supplier_products.create(supplier_id: supplier.id, product_quantity: 1)
      redirect_to supplier_products_path   
    end
  end

private
  def supplier_product_params
    params.require(:supplier_product).permit(:supplier_id, :product_id, :product_quantity)
  end
end