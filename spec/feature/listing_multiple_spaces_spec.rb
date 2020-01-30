feature 'list space' do
  scenario 'user can list multiple spaces' do
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
    click_on 'Take Me Home Country Road'
    click_on 'List a New Property'
    fill_in :space_name, with: 'Test Property 2'
    fill_in :city, with: 'Edinburgh'
    fill_in :description, with: 'test description 2'
    fill_in :ppn, with: '120'
    click_on 'Post'
    click_on 'List of Properties'
    expect(page).to have_content('Name: Test Property 2')
    expect(page).to have_content('City: Edinburgh')
    expect(page).to have_content('Description: test description 2')
  end
end