require 'pg'

class Space
  attr_reader :space_name, :city, :description, :ppn

  def initialize(space_name:, city:, description:, ppn:)
    @space_name = space_name
    @city = city
    @description = description
    @ppn = ppn
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(space_name: space['space_name'], city: space['city'], description: space['description'], ppn: space['ppn'])
    end
  end

end