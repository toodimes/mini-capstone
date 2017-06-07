class CategoriesController < ApplicationController

  def index

  end

  def new
    if current_user && current_user.admin
      @category = Category.new
      render "new.html.erb"
    else
      flash[:danger] = "You must be an admin to add a category"
      redirect_to "/login"
    end
  end

  def create
    @category = Category.new( 
      name: params[:name]
    )
    if @category.save
      flash[:success] = "#{@category.name} has been added."
      redirect_to "/products/?category=#{@cateogry.name}"
    else
      render "new.html.erb"
    end
  end

  def destroy

  end
end
