require 'pg'

class User

  attr_reader :id, :user_name, :password

  def initialize(id:, user_name:, password:)
    @id = id
    @user_name = user_name
    @password = password
  end

  def self.create(user_name:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end 
    result = connection.exec("INSERT INTO users (user_name, password) VALUES ('#{user_name}', '#{password}') RETURNING id, user_name, password;")
    User.new(id: result[0]['id'], user_name: result[0]['user_name'], password: result[0]['password'])
  end 

end