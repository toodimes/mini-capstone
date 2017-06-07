class ProductsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :create, :update, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]
  # @@random_item = Product.all.shuffle[0]

  def index
    if session[:count] == nil
      session[:count] = 1
    else
      session[:count] += 1
    end
    @visit_count = session[:count]

    if params[:sort] == "lowest"
      @products = Product.order(price: :asc)
    elsif params[:sort] == "highest"
      @products = Product.order(price: :desc)
    elsif params[:sort] == "discount"
      @products = Product.where("price <= ?", 10)
    elsif params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    else
      @products = Product.all
    end
    @categories = Category.all

    render "index.html.erb"
  end

  def new
    @product = Product.new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    @suppliers = Supplier.all
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description], quantity: params[:quantity], rating: params[:rating], supplier_id: params[:supplier_id])
    if @product.save
      catprod = CategorizedProduct.new(product_id: @product.id, category_id: params[:category_id])
      if catprod.save
        flash[:success] = "#{@product.name} has been created! :)"
        redirect_to "/products/#{@product.id}"
      else
        render "new.html.erb"
      end
    else
      render "new.html.erb"
    end
  end

  def show
    if params[:id] == "random"
      @product = Product.all.shuffle[0]
      # redirect_to "/products/#{product.id}"
    else
      @product = Product.find_by(id: params[:id])
    end
    @random_products = Product.all.sample(6)
      
    # 6.times do 
    #   @random_products << Product.all.shuffle[count]
    #   count += 1
    # end
    render "show.html.erb"
  end

  def search
    @products = Product.where("name ILIKE ?", "%#{params[:search]}%")
    render "index.html.erb"
  end

  def edit
    # if current_user.admin
    @product = Product.find_by(id: params[:id])
    @suppliers = Supplier.all
    render "edit.html.erb"
  end

  def update
    # if current_user && current_user.admin
    @product = Product.find_by(id: params[:id])
    @product.assign_attributes(
      name: params[:name], 
      price: params[:price], 
      description: params[:description], 
      quantity: params[:quantity], 
      rating: params[:rating], 
      supplier_id: params[:supplier_id]
    )
    if @product.save 
      flash[:info] = "#{@product.name} has been updated."
      redirect_to "/products/#{@product.id}"
    else
      @suppliers = Supplier.all
      render "edit.html.erb"
    end
  end

  def destroy
    # if current_user.admin
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Your product has been deleted."
    redirect_to "/products"

  end

end
