class ShopkeepersController < ApplicationController
  def index
    @shopkeepers = Shopkeeper.all
  end

  def create
    @shopkeeper = Shopkeeper.new(shopkeeper_params)
 
    if @shopkeeper.save
     redirect_to @shopkeeper
    else
    render 'new'
    end
  end

  def show
    @shopkeeper = Shopkeeper.find(params[:id])
  end
 
  private
    def shopkeeper_params
      params.require(:shopkeeper).permit(:name, :email)
    end
end

