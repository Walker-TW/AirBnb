class Booking 
  
  attr_reader :bookings_id, :space_id, :date, :user_id

  def initialize(bookings_id:, space_id:, date:, user_id:)
    @bookings_id = bookings_id
    @space_id = space_id
    @date = date
    @user_id = user_id
  end

  def self.create(space_id:, date:, user_id:)
    result = DatabaseConnection.query("INSERT INTO bookings (space_id, user_id, date) VALUES ('#{space_id}', '#{user_id}', '#{date}') RETURNING bookings_id, space_id, user_id, date")
    Booking.new(bookings_id: result[0]['bookings_id'], space_id: result[0]['space_id'], user_id: result[0]['user_id'], date: result[0]['date'])
  end

  def self.all(user_id:)
    result = DatabaseConnection.query("SELECT * FROM bookings WHERE user_id = '#{user_id}'")
    result.map do |booking|
      Booking.new(bookings_id: booking['bookings_id'], space_id: booking['space_id'], user_id: booking['user_id'], date: booking['date'])
    end
  end
end
