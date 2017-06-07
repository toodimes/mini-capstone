class Order < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal
    self.price * self.quantity
  end

  def calculate_tax
    self.tax = subtotal.to_f * 0.09
  end

  def calculate_total
    self.total = subtotal.to_f + tax.to_f
  end
end
