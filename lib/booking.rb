class Booking 
  
  attr_reader :space_name, :date, :user_id#, :renter_id

  def initialize(space_name:, date:, user_id:)#, renter_id: )
    @space_name = space_name
    @date = date
    @user_id = user_id
    # @renter_id = renter_id
  end

  def self.create(space_name:, date:, user_id:)#, renter_id: )
    result = DatabaseConnection.query("INSERT INTO bookings (space_name, date, user_id) VALUES ('#{space_name}', '#{city}', '#{description}', '#{ppn}') RETURNING space_name, city, description, ppn")
    Booking.new(space_name: result[0]['space_name'], city: result[0]['city'], description: result[0]['description'], ppn: result[0]['ppn'])
  end
end
