require 'spec_helper'

describe "Product Reminders" do 
  include LoginHelpers
  it "should let signed in users ask for a reminder." do
    pending "Look up date fill in syntax after bart"
    product = create(:product)
    current_user = login_user
    visit product_path(product)
    fill_in "Date", with: "3/12/2013"
    fill_in "Event", with: "Mothers Day"
    click_button "Add Reminder"
    expect(page).to have_content "Reminder created!"
    expect(current_user.reminders.last.product).to eq(product)
 end

  it "should prompt non logged in users to sign_in/sing_up" do
    pending "Look up date fill in syntax after bart"
  end
end

