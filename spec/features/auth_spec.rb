
require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New User"
  end
end


feature 'signing up a user' do
  before(:each) do
    visit new_user_url
    fill_in "Username", :with => "Jesus"
    fill_in "Password", :with => "asdfasdf"
    click_on "Submit Form"
  end
  scenario 'shows username on the homepage after signup' do
    expect(page).to have_content("Jesus")
  end
end


feature 'logging in' do
  User.create(username:'Lebron', password:'champion')
  before(:each) do
    visit new_session_url
    fill_in "Username", :with => "Lebron"
    fill_in "Password", :with => "champion"
    click_on "Come On In"
    save_and_open_page
  end
  scenario 'shows username on the homepage after login' do
    expect(page).to have_content("Lebron")
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
