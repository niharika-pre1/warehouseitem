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

  


  private

  def add_item
   @product = Product.find(params[:id])
       @user = current_user
   @user.products << @product
  end
   
  
  def product_params
    params.require(:product).permit(:name, :price, :description)
  end
end