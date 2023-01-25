class WarehouseProduct < ApplicationRecord
	belongs_to :warehouse,optional: true
	belongs_to :product,optional: true
	belongs_to :supplier_product,optional: true
	has_many :shopkeeper_products
end
