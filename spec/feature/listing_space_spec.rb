feature 'list space' do
  scenario 'user can list space' do
    user = User.create(user_name: "Ben G", password: "password456")
    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'password456'
    click_on 'Login'
    click_on 'List a New Property'
    fill_in :space_name, with: 'Test Property'
    fill_in :city, with: 'London'
    fill_in :description, with: 'test description'
    fill_in :ppn, with: '100'
    click_on 'Post'
    click_on 'List of Properties'
    expect(page).to have_content('Name: Test Property')
    expect(page).to have_content('City: London')
    expect(page).to have_content('Description: test description')
  end
end
