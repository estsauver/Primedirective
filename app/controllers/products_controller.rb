class ProductsController < ApplicationController
  before_action :require_admin, only: [ :create, :destroy]
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
  end

  private
 
  def product_params
    params.require(:product).permit(:title, :description, :price, :rating, :image_url)
  end

end
