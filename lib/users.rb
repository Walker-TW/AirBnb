require 'pg'
require 'bcrypt'

class User

  attr_reader :user_id, :user_name, :password

  def initialize(user_id:, user_name:, password:)
    @user_id = user_id
    @user_name = user_name
    @password = password
  end

  def self.create(user_name:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end
    encrypted_password = BCrypt::Password.create(password)
    result = connection.exec("INSERT INTO users (user_name, password) VALUES ('#{user_name}', '#{encrypted_password}') RETURNING user_id, user_name, password;")
    User.new(user_id: result[0]['user_id'], user_name: result[0]['user_name'], password: result[0]['password'])
  end
end

