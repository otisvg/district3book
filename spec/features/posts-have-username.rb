require 'rails_helper'
require_relative '../web_helper/web_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'display the username and time' do
    time = '2020-11-20 12:51:41'
    Timecop.freeze(time)

    visit '/'
    signup
    make_post

    expect(page).to have_content('example', count: 2)
    expect(page).to have_content(time)
  end
end
