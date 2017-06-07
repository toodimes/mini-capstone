class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  #Validations
  validates :name, :price, :description, :quantity, :in_stock, :rating, :presence => true
  validates :price, :quantity, :numericality => true
  validates :quantity, :numericality => { :only_integer => true }
  validates :description, length: { :maximum => 500 }
  
  def sale_message
    if price < 10
      message = "Discount Item!"
    else
      message = "Everyday Value!!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def blank_stars
    5 - rating.to_i
  end

  def self.search
    Product.where(name: params[:search])
  end

end
