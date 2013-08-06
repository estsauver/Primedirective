class HomesController < ApplicationController
  #I'm unclear what the convention is for this case where the root is a singleton 
  #resource. Is there a way to make this less awkwardly connected. 
  def show
    @products = Product.all
    @product = @products.first
    render "products/show"
  end
end
