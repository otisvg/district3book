require 'rails_helper'
require_relative '../web_helper/web_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Users can edit their own posts' do
    visit '/'
    signup
    make_post
    click_link 'edit'
    expect(page).to have_field('Message')
  end

  scenario 'A unsigned in user cannot edit posts' do
    visit '/'
    signup
    make_post
    click_link 'Sign Out'
    expect(page).not_to have_link('edit')
  end
end
