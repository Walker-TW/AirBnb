require 'capybara/rspec'

feature 'user sign up' do
  scenario 'a user can sign up for a new account' do
    visit('/')
    click_button 'Sign Up'
    fill_in :user_name, with: "Testy McTesterson"
    fill_in :password, with: "password123"
    click_button 'Join!'
    expect(page).to have_content('Congratulations Testy McTesterson, your account has been created!')
  end
end