require 'spec_helper'

describe "logging in" do
  include LoginHelpers
  it "should show a login link" do
    user = create(:user)
    product = create(:product)
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    expect(page).to have_content user.email
    expect(page).to have_content "Sign out"
    expect(page).to_not have_content "Sign in"
    click_link "Sign out" 
    expect(page).to have_content "Sign in"
    expect(page).to_not have_content user.email
    expect(page).to_not have_content "Sign out"
  end


  it "should show admin's the login panel after login" do 
    login_admin
    expect(page).to have_content("Admin Panel")
  end
end
