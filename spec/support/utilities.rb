include ApplicationHelper

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"

  # Manually remember cookie when not using Capybara
  cookies[:remember_token] = user.remember_token
end
