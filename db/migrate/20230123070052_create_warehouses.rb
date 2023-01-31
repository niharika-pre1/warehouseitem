class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.belongs_to :owner
      t.string :name

      t.timestamps
    end
  end
end
