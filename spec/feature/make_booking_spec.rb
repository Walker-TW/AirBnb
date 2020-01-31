feature 'user can book a space' do
  scenario 'user logs in and books an available' do
    user = User.create(user_name: "Ben G", password: "password456")
    space = Space.create(space_name: "Spacey MsSpacerson", city: "London", description:"119 Commerical Street, BR1 9ER", ppn:("£125"))
    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'password456'
    click_on 'Login'
    click_on 'List of Properties'
    click_on("Book This Property", :match => :first)
    expect(page).to have_content "You are booking Spacey MsSpacerson"
    fill_in :date, with: '2020-02-01'
    click_on 'Finalise Booking'
    expect(page).to have_content "Congratulations, you have booked #{space.space_name} for the date 2020-02-01" 
  end 
end 