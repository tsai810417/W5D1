require 'rails_helper'
require 'spec_helper'

feature 'the signup process' do
  before :each do
    visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content 'Sign Up'
  end

  scenario 'takes username and password' do
    expect(page).to have_content 'Username'
    expect(page).to have_content 'Password'
  end

  feature 'signing up a user' do
    before(:each) do
      fill_in 'Username', with: 'testing_username'
      fill_in 'Password', with: 'biscuits'
      click_on 'Create User'
    end

    scenario 'shows username on the homepage after signup'

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
