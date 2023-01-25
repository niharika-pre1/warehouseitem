class AddProductQuantityToShopkeeperProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :shopkeeper_products, :product_quantity, :integer
  end
end
