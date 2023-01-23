class Shopkeeper < User
	has_many :shopkeeper_products
	has_many :products,through: :shopkeeper_products
end
