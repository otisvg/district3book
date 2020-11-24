require 'rails_helper'
require_relative '../web_helper/web_helper.rb'

RSpec.feature "Timeline", type: :feature do
  scenario "Users can delete their own posts" do
    visit "/"
    signup
    make_post
    click_link "delete"
    expect(page).to_not have_content("this is a test post")
  end

  scenario "A unsigned in user cannot delete posts" do
    visit "/"
    signup
    make_post
    click_link "Sign Out"
    expect(page).not_to have_link("delete")
  end
end
