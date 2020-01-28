feature 'list space' do
  scenario 'there is a list of spaces' do
    visit '/list'
    expect(page).to have_content('house')
  end

  scenario 'user can list space' do
    visit '/' 
    click_on 'login'
    fill_in 'user_name', with: 'toadymctoadface'
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
