require 'users'
# require 'database_helpers'

describe Users do
  describe '#add' do
    it 'adds a new user' do
      connection = PG.connect(dbname: 'makersbnb_test')
    end
  end
end