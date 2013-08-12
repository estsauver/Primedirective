require 'spec_helper'

describe "Product Reminders" do 
  include LoginHelpers
  it "should let signed in users ask for a reminder." do
    product = create(:product)
    current_user = login_user
    visit product_path(product)
    fill_in "Event Date", with: "3/12/2013"
    click_button "Add Reminder"
    expect(page).to have_content "Reminder created!"
    expect(current_user.reminders.last.product).to eq(product)
 end
end

