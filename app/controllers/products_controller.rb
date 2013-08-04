class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    @product.save
    flash[:alert] = "Product Created!"
    redirect_to admin_path
  end

  private
 
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
end
