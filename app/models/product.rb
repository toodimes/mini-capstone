class Product < ApplicationRecord
  
  def sale_message
    if price < 2
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
