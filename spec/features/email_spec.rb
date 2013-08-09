require 'spec_helper'

describe "Signing up for an email" do 
  it "should let you enter an email to signup" do
    create(:product)
    visit root_path
    fill_in "E mail", with: "example@mail.com" 
    click_button "Get our best weekly gift ideas!" 
    expect(page).to have_content "Thanks for signing up!"
    expect(NewsletterRequest.find_by_email("example@mail.com")).to_not eq(nil)
  end

  it "should prevent you from signing up with a bad email" do
    pending "add mailchipm integration" 
    create(:product)
    visit root_path
    fill_in "E mail", with: "potato!"
    click_button "Get our best weekly gift ideas!"
    expect(page).to have_content "Sorry, that email didn't look write. Did you mistype something?"
  end
end
