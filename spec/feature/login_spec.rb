feature 'login' do
  scenario 'a user can login' do
    user = User.create(user_name: "Ben G", password: "password456")
    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'password456'
    click_on 'Login'
    expect(page).to have_content 'Sup toad Ben G'
  end

  scenario "user doesn't exist" do
    visit '/login/new'
    fill_in :user_name, with: 'Ria'
    fill_in :password, with: 'wrong_password'
    click_on 'Login'
    expect(page).to have_content 'Wrong username or password, please try again'
  end
end