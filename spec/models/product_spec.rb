require 'spec_helper'

describe Product do
  it "should respond to it's attributes" do 
    product = create(:product)
    expect(product.image_url).to_not eq(nil?)
    expect(product.rating).to_not eq(nil?)
    expect(product.price).to_not eq(nil?)
    expect(product.description).to_not eq(nil?)
    expect(product.title).to_not eq(nil?)
  end
end
