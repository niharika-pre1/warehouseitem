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
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def sub_item(id)
    byebug
    sp = SupplierProduct.find_by(product_id: id)
    if sp.product_quantity <= 0
      sp.update(product_quantity: nil)
    else
      sp.update(product_quantity: 
      sp.product_quantity - 1)
    end
  end
end