class Product < ApplicationRecord
  has_many :supplier_products
  has_many :suppliers, through: :supplier_products
  has_many :shopkeeper_products
  has_many :shopkeepers,through: :shopkeeper_products
  has_many :warehouse_products
  has_many :warehouses,through: :warehouse_products
end
