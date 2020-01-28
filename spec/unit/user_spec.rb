require 'users'
require 'database_helpers'

describe User do
  describe '#create' do
    it 'adds a new user' do
      # connection = PG.connect(dbname: 'makersbnb_test')
      user = User.create(user_name: "Testy McTesterson", password: "password123")
      persisted_data = persisted_data(id: user.id)
      expect(user).to be_a User
      expect(user.user_name).to eq 'Testy McTesterson'
      expect(user.password).not_to eq 'password123'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with("password123")
      user = User.create(user_name: "Testy McTesterson", password: "password123")
      expect(user.password).not_to eq 'password123'
    end
  end
end