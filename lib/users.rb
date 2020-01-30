require 'pg'
require 'bcrypt'
require './lib/database_connection'

class User

  attr_reader :user_id, :user_name, :password

  def initialize(user_id:, user_name:, password:)
    @user_id = user_id
    @user_name = user_name
    @password = password
  end

  def self.create(user_name:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (user_name, password) VALUES ('#{user_name}', '#{encrypted_password}') RETURNING user_id, user_name, password;")
    User.new(user_id: result[0]['user_id'], user_name: result[0]['user_name'], password: result[0]['password'])
  end

  def self.find(user_id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE user_id = #{user_id}")
    User.new(user_id: result[0]['user_id'], user_name: result[0]['user_name'], password: result[0]['password'])
  end

  def self.authenticate(user_name:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE user_name = '#{user_name}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(user_id: result[0]['user_id'], user_name: result[0]['user_name'], password: result[0]['password'])
  end
end
