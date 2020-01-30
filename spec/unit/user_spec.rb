require 'users'

describe User do
  describe '#create' do
    it 'adds a new user to the DB and creates new instance of User class' do
      user = User.create(user_name: "Ben G", password: "password456")
      expect(user).to be_a User
      expect(user.user_name).to eq 'Ben G'
      expect(user.password).not_to eq 'password456'
    end

    # xit 'hashes the password using BCrypt' do
    #   user = User.create(user_name: "Testy McTesterson", password: "password123")
    #   expect(BCrypt::Password).to receive(:create).with("password123")
    #   expect(user.password).not_to eq 'password123'
    # end
  end
  describe '#find' do
    it 'retrieves user from db' do
      user = User.create(user_name: "Testy McTesterson", password: "password123")
      result = User.find(user_id: user.user_id)
      expect(result.user_id).to eq user.user_id
      expect(result.user_name).to eq user.user_name
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(user_name: "Ben G", password: "password456")
      authenticated_user = User.authenticate(user_name: "Ben G", password: "password456")
  
      expect(authenticated_user.user_id).to eq user.user_id
    end
  end
end
