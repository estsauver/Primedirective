require 'spec_helper'

describe "Homepage and static pages" do
  it "should have the title amazon prime" do 
    visit root_path
    expect(page).to have_title("Prime Directive")
  end

  it "should have a logo" do
    visit root_path
    expect(page).to have_css("#logo")
  end

  it "should have a list of products" do
    visit root_path
    expect(page).to have_css("ul.products")
  end

  it "should have no more than 10 products" do
    visit root_path
    within("ul.products") do
      expect(page).to have_css("li.product", count: 2)
    end
  end

  it "should have a featured product" do
    product = create(:product)
    visit root_path
    expect(page).to have_css(".product.featured")
    expect(page).to have_css(".product.featured.title", text: product.title)
    expect(page).to have_css(".product.featured.description", text: product.description)
    expect(page).to have_css(".product.featured.price", text: product.price)
  end
end
