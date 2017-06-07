class CartedProductsController < ApplicationController

  def index
    if current_user
      @carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
      render "index.html.erb"
    else
      flash[:danger] = "You must be logged in"
      redirect_to "/"
    end
  end

  def create
    # product = Product.find_by(id: params[:id])
    if current_user
      @carted_product = CartedProduct.create(
        user_id: current_user.id, 
        product_id: params[:product_id], 
        quantity: params[:quantity]
      )
      redirect_to "/cart"
    else
      flash[:danger] = "You must be logged in to order"
      redirect_to "/products/#{product.id}"
    end
  end

  def edit
    carted_product = CartedProduct.find_by(user_id: current_user.id, id: params[:id], status: "carted")
    carted_product.update(quantity: params[:quantity])
    redirect_to "/cart"
  end

  def update
    @carted_product = CartedProduct.find_by(user_id: current_user.id, product_id: params[:id], status: "carted")
    @carted_product.update(status: "removed")
    redirect_to "/cart"
  end
end
