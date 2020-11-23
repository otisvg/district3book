def signup
  visit "/users/sign_up"
  fill_in "user_username", with: "example"
  fill_in "user_email", with: "example@exampl.com"
  fill_in "user_password", with: "123456"
  fill_in "user_password_confirmation", with: "123456"
  click_button "Sign up"
end

def make_post
  visit "/posts/new"
  fill_in "post_message", with: "this is a test post"
  click_button "Submit"
end