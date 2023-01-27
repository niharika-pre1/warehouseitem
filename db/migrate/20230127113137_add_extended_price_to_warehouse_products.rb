class AddExtendedPriceToWarehouseProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :warehouse_products, :extended_price, :integer
  end
end
