require 'rails_helper'


feature "User Log In Create Doc Versions and Navigate to Profile page" do



  scenario "User navigates to new user form, inputs valid version info and saves" do
    visit root_url
    click_link 'Register'

    expect(current_url).to eq "http://www.example.com/users/sign_up"
    fill_in 'Name', :with => 'Test Name'
    fill_in 'Email', :with => 'email@test.com'
    fill_in 'Password', :with => 'test1234'
    fill_in 'Password confirmation', :with => 'test1234'

    click_button 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'

    click_link 'New'

    fill_in 'Title', :with => 'valid title'
    fill_in 'Context', :with => 'valid context'
    fill_in 'Content', :with => 'valid content'

    click_button 'Create Document'

    expect(page).to have_content 'Version #1'
    expect(page).to have_content 'valid title'
    expect(page).to have_content 'valid context'
    expect(page).to have_content 'valid content'

    click_link 'Test Name'
    # expect(page).to have_content 'What Type of Feedback Are You Looking For?'

    # fill_in 'Title', :with => 'valid title'
    # fill_in 'Context', :with => 'valid context'
    # fill_in 'Content', :with => 'valid content'

    # check('Positivity') # check box button from feedback option sidebar

    # click_button 'Submit'

    # expect(current_url).to eq "www.example.com/documents/#{Document.first.id}"
    # expect(page).to have_content 'valid title'
    # expect(page).to have_content 'valid context'
    # expect(page).to have_content 'valid content'

    # expect(page).to have_content 'Positivity Results:'

  end


end
