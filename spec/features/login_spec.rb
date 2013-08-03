require 'spec_helper'

describe "logging in" do
  include LoginHelpers
  it "should show a login link" do
    login_admin
    expect(page).to have_content("Admin Panel")

  end
end
