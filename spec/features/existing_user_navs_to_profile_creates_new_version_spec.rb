require 'rails_helper'

feature "new document versions" do

            # fill_in 'Name', :with => 'Test Name'
        # fill_in 'Email', :with => 'email@test.com'
        # fill_in 'Password', :with => 'test1234'
        # fill_in 'Password confirmation', :with => 'test1234'

        # click_button 'Sign up'


    scenario "User navigates to new user form, inputs valid version info and saves" do
        visit root_url
        click_link 'Login'

        expect(current_url).to eq "http://www.example.com/users/sign_in"


        # expect(page).to have_content 'Welcome! You have signed up successfully.'

        # click_link 'New'

        # fill_in 'Title', :with => 'valid title'
        # fill_in 'Context', :with => 'valid context'
        # fill_in 'Content', :with => 'valid content'

        # click_button 'Create Document'

        # expect(page).to have_content 'Version #1'
        # expect(page).to have_content 'valid title'
        # expect(page).to have_content 'valid context'
        # expect(page).to have_content 'valid content'

        # click_link 'Test Name'
        # expect(current_url).to eq "http://www.example.com/users/#{User.last.id}"

        # expect(page).to have_content 'valid title'
        # expect(page).to have_content 'valid context'
    end
end
