require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "can only be written by signed in users" do
    visit "/"

    expect(page).to have_no_link 'New post', href: new_post_path

  end
end

