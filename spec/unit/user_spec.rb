require 'users'
require 'database_helpers'

describe User do
  describe '#add' do
    it 'adds a new user' do
      # connection = PG.connect(dbname: 'makersbnb_test')
      user = User.create(user_name: "Testy MCTesterson", password: "password123")
      persisted_data = persisted_data(id: user.id)
      expect(user).to be_a User
      expect(user.user_name).to eq 'Testy MCTesterson'
      expect(user.password).to eq 'password123'
    end
  end
end