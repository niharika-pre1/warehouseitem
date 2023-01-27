class CreateShopkeeperProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopkeeper_products do |t|
      t.belongs_to :shopkeeper,null: true
      t.belongs_to :product,null: true

      t.timestamps
    end
  end
end
