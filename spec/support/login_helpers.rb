module LoginHelpers

  def login_admin
    user = create(:admin)
    visit sign_in_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    return user
  end
  def login_user
    user = create(:user)
    visit sign_in_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
    return user
  end
end
