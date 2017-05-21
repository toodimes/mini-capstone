class ProductsController < ApplicationController

  # @@random_item = Product.all.shuffle[0]

  def index
    if params[:sort] == "lowest"
      @products = Product.order(price: :asc)
    elsif params[:sort] == "highest"
      @products = Product.order(price: :desc)
    elsif params[:sort] == "discount"
      @products = Product.where("price <= ?", 10)
    else
      @products = Product.all
    end


    render "index.html.erb"
  end

  def new
    @suppliers = Supplier.all
    render "new.html.erb"
  end

  def create
    product = Product.create(name: params[:name], price: params[:price], image: params[:image], description: params[:description], quantity: params[:quantity], rating: params[:rating], supplier_id: params[:supplier_id])
    flash[:success] = "#{product.name} has been created! :)"
    redirect_to "/products/#{product.id}"
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
    @product = Product.find_by(id: params[:id])
    @suppliers = Supplier.all
    render "edit.html.erb"
  end

  def update
    product = Product.find_by(id: params[:id])
    product.update(name: params[:name], price: params[:price], image: params[:image], description: params[:description], quantity: params[:quantity], rating: params[:rating], supplier_id: params[:supplier_id])
    flash[:info] = "#{product.name} has been updated."
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Your product has been deleted."
    redirect_to "/products"
  end

end
