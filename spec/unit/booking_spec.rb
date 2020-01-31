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
      expect(booking.space_id).to eq space.space_id #add space name if poss
      expect(booking.date).to eq "2020-01-30"
    end
  end
end