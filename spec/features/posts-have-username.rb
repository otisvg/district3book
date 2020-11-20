require 'rails_helper'
require_relative '../web_helper/web_helper.rb'

RSpec.feature "Posts", type: :feature do
  scenario "display the username" do
    visit "/"
    signup
    make_post

    expect(page).to have_content("example", count: 2)
  end
end
