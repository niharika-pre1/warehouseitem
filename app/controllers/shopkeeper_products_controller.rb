class ShopkeeperProductsController < ApplicationController
  def index
    @shopkeeper_products = ShopkeeperProduct.all
  end
end
