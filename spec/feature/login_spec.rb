feature 'login' do
  scenario 'a user can login' do
    User.create(user_name: "Ben G", password: "password456")
    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'password456'
    click_on 'Login'
    expect(page).to have_content 'Sup toad Ben G'
  end

  scenario 'a user can logout' do
    User.create(user_name: "Ben G", password: "password456")
    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'password456'
    click_on 'Login'
    click_on 'Log out'
    expect(page).not_to have_content 'Sup toad Ben G'
    expect(page).to have_content 'You are now Logged Out. Goodbye.'
    expect(current_path).to eq '/loggedout'
  end

  scenario 'a user sees an error if they get user_name wrong' do 
    User.create(user_name: "Ben G", password: "password456")

    visit '/login/new'
    fill_in :user_name, with: 'not right'
    fill_in :password, with: 'password456'
    click_on 'Login'

    expect(page).not_to have_content 'Sup toad Ben G'
    expect(page).to have_content "Please check you username or password"
    expect(page).to have_button 'Back to Login'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(user_name: "Ben G", password: "password456")

    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'wrongpassword'
    click_button 'Login'

    expect(page).not_to have_content 'Welcome, Ben G'
    expect(page).to have_content 'Please check you username or password'
    expect(page).to have_button 'Back to Login'
  end
end