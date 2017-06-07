class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id)
    render "index.html.erb"
  end

  def create
    @products = CartedProduct.where(user_id: current_user.id, status: "carted")
    subtotal = 0
    @products.each do | product|
      subtotal = product.product.calculate_subtotal
      # subtotal += product.product.price * product.quantity
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    order = Order.new(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)
    if order.save
      @products.update(status: "purchased", order_id: order.id)
      flash[:success] = "Order has been placed!"
      redirect_to "/orders/#{order.id}"
    else
      puts "#{order.tax} is this"
      @product = Product.find_by(id: params[:product_id])
      flash[:danger] = "#{order.errors.full_messages}"
      render "/products/show.html.erb"
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    if current_user.id == @order.user_id
      render "show.html.erb"
    else
      flash[:danger] = "That is not your account"
      redirect_to "/"
    end
  end

end
