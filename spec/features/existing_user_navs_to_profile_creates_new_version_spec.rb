require 'rails_helper'
require_relative 'session_helpers'

feature "new document versions" do

    include Features::UserDocHelpers

    ## BUG BUG -- logging in with devise in feature tests is failing. much googling, but new_user_signup in session_helpers module

    before :each do
        User.create(:email => 'test@example.com', :password => 'test1234', name: 'user')

    end

    scenario "Creates new Doc, adds a new version" do
        new_user_sign_up

        user_creates_doc_and_initial_version

        visit user_path(User.last)

        click_link Document.last.title
        expect(page).to have_content 'Version #1'
        # fill_in 'Title', :with => 'valid title'
        # fill_in 'Context', :with => 'valid context'
        # fill_in 'Content', :with => 'valid content'

        # click_button 'Create Document'

        # expect(page).to have_content 'Version #1'

        # expect(page).to have_content 'valid context'
        # expect(page).to have_content 'valid content'

        # click_link 'Test Name'
        # expect(current_url).to eq "http://www.example.com/users/#{User.last.id}"

        # expect(page).to have_content 'valid title'
        # expect(page).to have_content 'valid context'
    end
end
