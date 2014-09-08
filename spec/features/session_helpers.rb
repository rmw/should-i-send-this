module Features
  module UserDocHelpers
    def new_user_sign_up
      visit root_url
      click_link 'Register'
      fill_in 'Name', :with => 'Test Name'
      fill_in 'Email', :with => 'email@test.com'
      fill_in 'Password', :with => 'test1234'
      fill_in 'Password confirmation', :with => 'test1234'

      click_button 'Sign up'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    def user_creates_doc_and_initial_version
      # click_link 'New'

      # fill_in 'Title', :with => 'valid title'
      # fill_in 'Context', :with => 'valid context'
      # fill_in 'Content', :with => 'valid content'

      # click_button 'Create Document'

      pending
    end

  end
end
