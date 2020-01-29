feature 'list space' do
  scenario 'user can list space' do
    visit '/' 
    click_on 'login'
    fill_in 'username', with: 'toadymctoadface'
    fill_in 'password', with: 'ribbit'
    click_on 'enter'
    click_on 'create a new listing'
    fill_in 'name', with: 'name'
    fill_in 'description', with: 'description'
    fill_in 'ppn', with: 100
    click_on 'enter'
    expect(page).to have_content('your listing has been added')
  end
end
