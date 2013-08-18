require 'spec_helper'

describe "Homepage and static pages" do
  before(:each) do
    @products = create_list(:product, 10)
  end
  it "should have the title amazon prime" do 
    visit root_path
    expect(page).to have_title "ZenGifting"
  end

  it "should have a logo linking to home" do
    visit root_path
    within "#logo" do
      expect(page).to have_css("img")
    end

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
    expect(page).to have_link(product.title, :href => product.link)

    expect(page).to have_css(".product.featured.description", text: product.description)
    expect(page).to have_css(".product.featured.image")
    expect(page).to have_css(".product.featured.rating", text:"Editors Rating: #{product.rating}")
    expect(page).to have_css(".product.featured.price", text: "Price: #{product.price} $")
  end

  it "should displaynewlines in product" do 
    product = create(:product, :description => "This has a newline \n Hey It has one")
    visit root_path
    within(".product.featured.description") do 
      expect(page).to have_css("br")
    end
  end

  it "should show the most recently created product" do
    create(:product)
    last = create(:product)
    visit root_path
    expect(page).to have_css('.featured.title', text: last.title)
  end

  it "clicking a sidebar link should show the product" do 
    random_product = @products.shuffle.first
    visit root_path
    click_link random_product.title
    expect(page).to have_css(".product.featured.title", text: random_product.title)
    expect(page).to have_css("li.active", text: random_product.title)
  end

  it "should have an email newsletter signup" do 
    visit root_path
    expect(page).to have_css(".email.signup") 
  end
end
