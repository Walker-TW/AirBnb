require 'pg'

class Space
  attr_reader :space_name, :city, :description, :ppn

  def initialize(space_name:, city:, description:, ppn:)
    @space_name = space_name
    @city = city
    @description = description
    @ppn = ppn
  end

  def self.find(space_name:)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE space_name = '#{space_name}'")
    Space.new(space_name: result[0]['space_name'], city: result[0]['city'], description: result[0]['description'], ppn: result[0]['ppn'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map do |space|
      Space.new(space_name: space['space_name'], city: space['city'], description: space['description'], ppn: space['ppn'])
    end
  end

  def self.create(space_name:, city:, description:, ppn:)
    result = DatabaseConnection.query("INSERT INTO spaces (space_name, city, description, ppn) VALUES ('#{space_name}', '#{city}', '#{description}', '#{ppn}') RETURNING space_name, city, description, ppn")
    Space.new(space_name: result[0]['space_name'], city: result[0]['city'], description: result[0]['description'], ppn: result[0]['ppn'])
  end

end