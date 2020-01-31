feature 'listing a users bookings' do 
  scenario 'a user can view their bookings (has two)' do 
    user = User.create(user_name: "Ben G", password: "password456")
    space = Space.create(space_name: "Spacey MsSpacerson", city: "London", description:"119 Commerical Street, BR1 9ER", ppn:("£125"))
    space2 = Space.create(space_name: "Spacey McSpaceface", city: "Bristol", description:"120 Fake Street BR2 911", ppn:"£130")

    booking = Booking.create(space_id: space.space_id, date: "2020-01-30", user_id: user.user_id)
    booking2 = Booking.create(space_id: space2.space_id, date: "2020-01-30", user_id: user.user_id)

    visit '/login/new'
    fill_in :user_name, with: 'Ben G'
    fill_in :password, with: 'password456'
    click_on 'Login'
    click_on 'Go to my bookings'
    expect(page).to have_content(booking.bookings_id)
    # expect(page).to have_content('Name: Spacey MsSpacerson')
    # expect(page).to have_content('City: London')
    # expect(page).to have_content('Description: 119 Commerical Street, BR1 9ER')
    expect(page).to have_content('Date: 2020-01-30')

    # expect(page).to have_content('Name: Spacey McSpaceface')
    # expect(page).to have_content('City: Bristol')
    # expect(page).to have_content('Description: 120 Fake Street BR2 911')
    # expect(page).to have_content('Date: 2020-01-30')
  end 
end 