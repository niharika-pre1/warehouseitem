class DashboardController < ApplicationController
  def index
   @warehouse_products =WarehouseProduct.all
  end
end
