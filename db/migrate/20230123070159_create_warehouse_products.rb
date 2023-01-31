class CreateWarehouseProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouse_products do |t|
      t.belongs_to :supplier_product,null: true
      t.belongs_to :warehouse,null: true
      t.belongs_to :product,null:true

      t.timestamps
    end
  end
end
