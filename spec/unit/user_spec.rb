require 'users'
require 'database_helpers'

describe User do
  describe '#create' do
    it 'adds a new user to the DB and creates new instance of User class' do
      user = User.create(user_name: "Ben G", password: "password456")
      # persisted_data = persisted_data(id: user.id)
      expect(user).to be_a User
      expect(user.user_name).to eq 'Ben G'
      expect(user.password).not_to eq 'password456'
    end

    xit 'hashes the password using BCrypt' do
      user = User.create(user_name: "Testy McTesterson", password: "password123")
      expect(BCrypt::Password).to receive(:create).with("password123")
      expect(user.password).not_to eq 'password123'
    end
  end

  describe '#find' do
    it 'retrieves user from db' do
      user = User.create(user_name: "Testy McTesterson", password: "password123")
      result = User.find(id: user.id)
      expect(result.id).to eq user.id
      expect(result.user_name).to eq user.user_name
    end
  end

  describe '.authenticate' do
    it 'returns the user if the info is right and if it exists' do
      user = User.create(user_name: "Testy McTesterson", password: "password123")
      auth_user = User.authenticate(user_name: "Testy McTesterson", password: "password123")
      expect(auth_user.id).to eq user.id
    end
  end
end
