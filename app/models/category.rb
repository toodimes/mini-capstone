class Category < ApplicationRecord
  has_many :products
  has_many :categorized_products
  has_many :products, through: :categorized_products

  validates :name, presence: true

end
