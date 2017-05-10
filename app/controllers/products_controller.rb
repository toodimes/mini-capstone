class ProductsController < ApplicationController

  def product_method

    @products = Product.all

    render "product_view.html.erb"
  end

  def new_product_method
    render "create_new_product.html.erb"
  end

  def new_product_result_method
    Product.create(name: params[:name], price: params[:price], image: params[:image], description: params[:description], quantity: params[:quantity])

    @products = Product.all

    render "product_view.html.erb"
  end

end
