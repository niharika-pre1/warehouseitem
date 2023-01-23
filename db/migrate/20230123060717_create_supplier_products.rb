class CreateSupplierProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_products do |t|
      t.belongs_to :supplier,null: true
      t.belongs_to :product,null: true

      t.timestamps
    end
  end
end
