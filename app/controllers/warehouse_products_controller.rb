class WarehouseProductsController < ApplicationController
  def index
  @warehouse_products = WarehouseProduct.all
  end
end
