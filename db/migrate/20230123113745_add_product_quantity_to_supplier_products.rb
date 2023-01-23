class AddProductQuantityToSupplierProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_products, :product_quantity, :integer
  end
end
