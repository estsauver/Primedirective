require 'spec_helper'

describe "Homepage and static pages" do
  it "It should have the title amazon prime" do 
    visit root_path
    expect(page).to have_title("Amazon Prime")
  end

  it "should have a logo" do
    visit root_path
    expect(page).to have_css(".logo")
  end

end
