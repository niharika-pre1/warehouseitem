class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

   def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
 
    if @warehouse.save
     redirect_to @warehouse
    else
    render 'new'
    end
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  private
  def warehouse_params
    params.require(:warehouse).permit(:name)
  end
end
