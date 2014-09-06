require 'rails_helper'


feature "User Log In and Access To Personal Items" do

  pending

  # background do
  #   User.make(:email => 'user@example.com', :password => 'caplin')
  # end

  scenario "User navigates to new user form, inputs valid version info and saves" do
    visit root_url
    click_link 'Register'

    expect(current_url).to eq "http://www.example.com/users/sign_up"
    fill_in 'Name', :with => 'Test Name'
    fill_in 'Email', :with => 'email@test.test'
    fill_in 'Password (8 characters minimum)', :with => 'testpassword'
    fill_in 'Password confirmation', :with => 'testpassword'


    expect(page).to have_content 'Title'
    # expect(page).to have_content 'Context'
    # expect(page).to have_content 'Content'

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
