require 'rails_helper'
require_relative 'session_helpers'

feature "User Logs In Create Doc Versions and Navigate to Profile page" do
  include Features::UserDocHelpers

  scenario "User navigates to new user form, inputs valid version info and saves" do
    new_user_sign_up

    user_creates_doc_and_initial_version

    expect(page).to have_content 'Version #1'
    expect(page).to have_content 'valid title'
    expect(page).to have_content 'valid context'
    expect(page).to have_content 'valid content'

    click_link 'Test Name'
    expect(current_url).to eq "http://www.example.com/users/#{User.last.id}"

    expect(page).to have_content 'valid title'
    expect(page).to have_content 'valid context'
  end
end
