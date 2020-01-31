require 'pg'

class Space
  attr_reader :space_id, :space_name, :city, :description, :ppn, :image

  def initialize(space_id:, space_name:, city:, description:, ppn:, image:)
    @space_id = space_id
    @space_name = space_name
    @city = city
    @description = description
    @ppn = ppn
    @image = image
  end

  def self.find(space_name:)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE space_name = '#{space_name}'")
    Space.new(space_id: result[0]['space_id'], space_name: result[0]['space_name'], city: result[0]['city'], description: result[0]['description'], ppn: result[0]['ppn'], image: result[0]['image'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map do |space|
      Space.new(space_id: space['space_id'], space_name: space['space_name'], city: space['city'], description: space['description'], ppn: space['ppn'], image: space['image'])
    end
  end

  def self.create(space_name:, city:, description:, ppn:)
    result = DatabaseConnection.query("INSERT INTO spaces (space_name, city, description, ppn) VALUES ('#{space_name}', '#{city}', '#{description}', '#{ppn}') RETURNING space_id, space_name, city, description, ppn, image")
    Space.new(space_id: result[0]['space_id'], space_name: result[0]['space_name'], city: result[0]['city'], description: result[0]['description'], ppn: result[0]['ppn'], image: result[0]['image'])
  end

end