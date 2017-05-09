class ProductsController < ApplicationController

  def product_method

    @products = Product.all

    render "product_view.html.erb"
  end


end
