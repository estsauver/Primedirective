class AdminsController < ApplicationController
  before_action :authorize
  before_action :require_admin
  def show
    @product = Product.new
    @products = Product.all
  end

private
    def require_admin
      unless current_user.admin
        flash[:alert] = "Nothing to see here! Move along citizen."
        redirect_to root_path 
      end
    end
end
