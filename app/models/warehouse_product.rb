class WarehouseProduct < ApplicationRecord
	belongs_to :warehouse,optional: true
	belongs_to :product,optional: true
end
