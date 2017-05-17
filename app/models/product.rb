class Product < ApplicationRecord
  
  def sale_message
    if price.to_f < 2
      message = "Discount Item!"
    else
      message = "Everyday Value!!"
    end
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def blank_stars
    5 - rating.to_i
  end

end
