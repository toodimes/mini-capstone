class UsersController < ApplicationController

  def new
    render "new.html.erb"
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "New user: #{user.name} has been created."
      redirect_to "/products"
    else
      flash[:danger] = "Invalid username or password."
      redirect_to "/signup"
    end
  end

  def show
    @orders = Order.where(user_id: current_user.id)
    render "show.html.erb"
  end

end
