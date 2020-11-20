require 'rails_helper'

RSpec.feature "Register", type: :feature do
  scenario "can register for an account" do
    visit "/users/sign_up"
    fill_in "user_username", with: "example"
    fill_in "user_email", with: "example@exampl.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"
    expect(page).to have_content("Welcome, example")
  end
end