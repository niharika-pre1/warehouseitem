class SupplierProduct < ApplicationRecord
	belongs_to :supplier,optional: true
	belongs_to :product,optional: true
end
