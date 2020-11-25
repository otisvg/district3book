require 'rails_helper'

RSpec.feature 'Sign out', type: :feature do
  scenario 'user can sign out of their account' do
    visit '/users/sign_up'
    fill_in 'user_username', with: 'example'
    fill_in 'user_email', with: 'example@exampl.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Sign up'
    click_link 'Sign Out'
    expect(page).to have_content('Signed out successfully.')
  end
end
