class AddProductQuantityToWarehouseProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouse_products, :product_quantity, :integer
  end
end
