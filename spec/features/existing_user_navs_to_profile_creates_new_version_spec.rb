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
        click_link 'new version'

        expect(page).to have_content Document.last.title
        fill_in 'Content', :with => 'Updating version with new text.'
        click_button 'Update Document'
        expect(current_url).to eq "http://www.example.com/documents/#{Document.last.id}"
        expect(page).to have_content 'Version #2'
        expect(page).to have_content 'Updating version with new text.'
    end
end
