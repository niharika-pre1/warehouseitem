class Supplier < User
  has_many :supplier_products
  has_many :products, through: :supplier_products
end
