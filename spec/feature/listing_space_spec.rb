feature 'list space' do
  scenario 'there is a list of spaces' do
    visit '/list'
    expect(page).to have_content('sparta')
  end

  scenario 'user can list space' do
    visit '/new'
    fill_in 'space_name', with: 'space_name'
    fill_in 'city', with: 'city'
    fill_in 'description', with: 'description'
    fill_in 'ppn', with: 100
    click_on 'Post'
    click_on 'List Properties'
    expect(page).to have_content('space_name')
  end
end
