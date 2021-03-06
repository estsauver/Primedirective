require 'spec_helper'

describe 'Admin Panel' do
  include LoginHelpers
  it "should include the phrase admin panel" do 
    login_admin
    expect(page).to have_content("Admin Panel")
  end

  it "should deny access to non-admin users" do
    user = create(:user)
    visit admin_path(as: user)
    expect(page).to_not have_content("Admin Panel")
  end

  it "should deny access to guests" do
    visit admin_path
    expect(page).to_not have_content("Admin Panel")
  end

  it "should let you make a product" do
    login_admin
    fill_out_form
    expect(page).to have_content "Product Created!"
    expect(page).to have_content "New spangled widget"
    #should accept the right params
    first_product = Product.first

    expect(first_product.description).to eq("It's got electrolytes!")
    expect(first_product.image_url).to eq("http://ecx.images-amazon.com/images/I/71pTlCgTTrL._SL1500_.jpg")
    expect(first_product.rating).to eq(4.0)
    expect(first_product.price).to eq(5.01)
  end

  it "should let you delete a product" do
    login_admin
    fill_out_form
    expect do
       click_link "Delete", match: :first
    end.to change(Product, :count).by(-1)
  end

  it "should let you edit a product" do
    login_admin
    fill_out_form
    click_link "Edit", match: :first
    fill_in "Title", with: "Renamed widget"
    fill_in "Link", with: "http://www.amazon.com/gp/product/B00076SCVG/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B00076SCVG&linkCode=as2&tag=zengif-20"
    click_button "Submit"
  end

  it "should let you sign out" do 
    create(:product)
    login_admin 
    click_link "Sign out"
    login_user
    visit admin_path
    expect(page).to have_content("Nothing to see here!")
  end
end

def fill_out_form
    fill_in "Title", with: "New spangled widget"
    fill_in "Description", with: "It's got electrolytes!"
    fill_in "Price", with: 5.01
    fill_in "Rating", with: 4.0
    fill_in "Image Url", with: "http://ecx.images-amazon.com/images/I/71pTlCgTTrL._SL1500_.jpg"
    click_button "Submit"
end
