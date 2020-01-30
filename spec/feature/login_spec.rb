feature 'login' do
  scenario 'a user can login' do
    user = User.create(user_name: "Ben G", password: "password456")
    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'password456'
    click_on 'Login'
    expect(page).to have_content 'Sup toad Ben G'
  end

  scenario 'a user can logout' do
    user = User.create(user_name: "Ben G", password: "password456")
    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'password456'
    click_on 'Login'
    click_on 'Log out'
    expect(page).not_to have_content 'Sup toad Ben G'
    expect(current_path).to eq '/'
  end
end