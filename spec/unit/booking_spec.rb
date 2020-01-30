require 'booking'

describe Booking do 
  describe '#create' do 
    it 'adds a new space to the DB and creates a new instance of Space class' do 
      booking = Booking.create(space_name: "pls work", date: "2020-01-30", user_id: "770")
      expect(booking).to be_a (Booking)
      expect(booking.space_name).to eq "pls work"
      expect(booking.date).to eq "2020-01-30"
    end
  end
end