require 'spec_helper'

describe "Products" do
  include LoginHelpers
  describe "Post /products" do
    it "should create a product" do
      user = create(:admin)
      User.authenticate(user.email, user.admin)
      post_via_redirect products_path, :product => {:title => "Cool product"}
    end

    it "should not let a non logged in user create a product" do
      create(:product)
      post products_path, :product => {:title => "Cool product"}
      expect(response.status).to eq(401)
    end
  end
end
