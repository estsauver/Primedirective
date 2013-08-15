require 'spec_helper'

describe "Product Reminders" do 
  include LoginHelpers
  it "should let signed in users ask for a reminder." do
    product = create(:product)
    current_user = login_user
    visit product_path(product)
    fill_in "Event", with: "Mothers Day"
    fill_in "reminder_date", with: "2013-07-29"
    click_button "Add Reminder"
    expect(page).to have_content "Reminder created!"
    reminder = current_user.reminders.last
    expect(reminder.product).to eq(product)
    expect(reminder.event).to eq "Mothers Day"
    expect(reminder.date).to eq(Time.new(2013,7,29, 0 , 0 ,0, "+00:00").to_datetime)
 end

  it "should prompt non logged in users to sign_in/sing_up" do
    product = create(:product)
    visit product_path(product)
    fill_in "Event", with: "Mothers Day"
    fill_in "reminder_date", with: "2013-07-29"
    click_button "Add Reminder"
    expect(page).to have_content "Please login or signup first!"
  end
end

