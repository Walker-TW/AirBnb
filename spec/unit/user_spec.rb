require 'users'

describe User do
  describe '#create' do
    it 'adds a new user to the DB and creates new instance of User class' do
      user = User.create(user_name: "Ben G", password: "password456")
      expect(user).to be_a User
      expect(user.user_name).to eq 'Ben G'
      expect(user.password).not_to eq 'password456'
    end

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

    it 'returns nil when given incorrect user_name' do 
      user = User.create(user_name: "Ben G", password: "password456")

      expect(User.authenticate(user_name: "Not Right", password: "password456")).to be_nil
    end 

      it 'returns nil given an incorrect password' do
        user = User.create(user_name: "Ben G", password: "password456")
    
        expect(User.authenticate(user_name: "Ben G", password: "not right")).to be_nil
      end
    
  end
end
