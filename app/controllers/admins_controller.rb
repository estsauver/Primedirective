class AdminsController < ApplicationController
  before_action :authorize
  before_action :require_admin
  def show
    @product = Product.new
  end

private
    def require_admin
      redirect_to root_path unless current_user.admin
    end
end
