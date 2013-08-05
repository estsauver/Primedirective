require 'spec_helper'

describe "Homepage and static pages" do
  before(:each) do
    @products = create_list(:product, 15)
  end
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

  it "should have no every product in the list" do 
    visit root_path
    within("ul.products") do
      expect(page).to have_css("li.product", count: Product.count)
    end
  end

  it "should have a featured product" do
    product = create(:product)
    visit root_path
    expect(page).to have_css(".product.featured")
    expect(page).to have_css(".product.featured.title", text: product.title)
    expect(page).to have_css(".product.featured.description", text: product.description)
    expect(page).to have_css(".product.featured.image")
    expect(page).to have_css(".product.featured.rating", text:"Editors Rating: #{product.rating}")
    expect(page).to have_css(".product.featured.price", text: "Price: #{product.price} $")
  end

  it "should show the most recently created product" do
    create(:product)
    last = create(:product)
    visit root_path
    expect(page).to have_css('.featured.title', text: last.title)
  end
end
