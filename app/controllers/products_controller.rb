class ProductsController < ApplicationController
  before_action :require_admin, only: [ :create, :destroy, :edit, :update]
  def create
    @product = Product.new(product_params)
    @product.save
    flash[:alert] = "Product Created!"
    redirect_to admin_path
  end
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product Destroyed"
    redirect_to admin_path
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.all
    respond_to do |format|
      format.html 
      format.json {render :json => @product}
    end
  end
  
  def index
    @products = Product.all
    respond_to do |format|
      format.json {render :json => @products}
    end
  end
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to(@product)
    else
      render "edit"
    end
  end

  private
 
  def product_params
    params.require(:product).permit(:title, :description, :price, :rating, :image_url, :link)
  end

end
