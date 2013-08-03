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
    save_and_open_page
    fill_in "Title", with: "New spangled widget"
    fill_in "Description", with: "It's got electrolytes!"
    fill_in "Price", with: 5.01
    click_button "Create"
  end

end
