class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end

  def add_item
     supplier = Supplier.first
    @product = Product.find(params[:id])
   @supplier_products = SupplierProduct.pluck(:product_id)
    if  @supplier_products.include?(@product.id)
    @supplier_products = @product.supplier_products
    @supplier_product = @product.supplier_products.update(product_quantity: :product_quantity + 1 )

    else
      @supplier_product = @product.supplier_products.create(supplier_id: params[:supplier_id])
       redirect_to supplier_products_path
    end
  end

  private

  
  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end