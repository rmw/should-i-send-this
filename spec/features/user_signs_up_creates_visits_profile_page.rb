require 'rails_helper'
require_relative 'session_helpers'

feature "User creates new document" do
  include Features::UserDocHelpers

  scenario "navigates to new user form, inputs valid version info and saves" do
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

  scenario "navigates to new user form, inputs invalid, recieves error message" do
    new_user_sign_up
    click_link 'New'

    fill_in 'Title', :with => 'valid title'
    click_button 'Create Document'
    expect(page).to have_content 'Error, improper submission'



  end
end
