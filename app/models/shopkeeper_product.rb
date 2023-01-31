class ShopkeeperProduct < ApplicationRecord
	belongs_to :shopkeeper,optional: true
	belongs_to :product,optional: true
	belongs_to :warehouse_product,optional: true
end
