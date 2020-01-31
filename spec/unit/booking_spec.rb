require 'booking'
require 'space'

describe Booking do 
  describe '#create' do 
    it 'adds a new space to the DB and creates a new instance of Space class' do
      user = User.create(user_name: "Ben G", password: "password456")
      # user_found = user.find
      Space.create(space_name: "Spacey MsSpacerson", city: "London", description:"119 Commerical Street, BR1 9ER", ppn:("£125"))
      space = Space.find(space_name: "Spacey MsSpacerson")
      booking = Booking.create(space_id: space.space_id, date: "2020-01-30", user_id: user.user_id)
      expect(booking).to be_a (Booking)
      expect(booking.space_id).to eq space.space_id
      expect(booking.date).to eq "2020-01-30"
    end
  end

  describe '#all' do 
    it 'returns all bookings for user' do 
      user = User.create(user_name: "Ben G", password: "password456")
      
      space = Space.create(space_name: "Spacey MsSpacerson", city: "London", description: "119 Commerical Street BR1 9ER", ppn:"£125")
      space2 = Space.create(space_name: "Spacey McSpaceface", city: "Bristol", description:"120 Fake Street BR2 911", ppn:"£130")
      
      booking = Booking.create(space_id: space.space_id, date: "2020-01-30", user_id: user.user_id)
      booking2 = Booking.create(space_id: space2.space_id, date: "2020-01-30", user_id: user.user_id)
      
      bookings = Booking.all(user_id: user.user_id)
      p "bookings"
      p bookings
      expect(bookings.length).to eq 2
      expect(bookings[1].space_id).to eq space2.space_id
      expect(bookings[0].user_id).to eq user.user_id
    end
  end
end