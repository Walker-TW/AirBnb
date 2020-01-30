require 'space'

describe Space do 
  describe '#create' do 
    it 'adds a new space to the DB and creates a new instance of Space class' do 
      space = Space.create(space_name: "Spacey MsSpacerson", city: "London", description:"119 Commerical Street, BR1 9ER", ppn:("£125"))
      expect(space).to be_a (Space)
      expect(space.space_name).to eq "Spacey MsSpacerson"
      expect(space.city).to eq "London"
      expect(space.description).to eq "119 Commerical Street, BR1 9ER"
      expect(space.ppn).to eq "£125"
    end
  end

  describe '#all' do 
    it 'returns all spaces in DB' do 
      space = Space.create(space_name: "Spacey MsSpacerson", city: "London", description: "119 Commerical Street BR1 9ER", ppn:"£125")
      space2 = Space.create(space_name: "Spacey McSpaceface", city: "Bristol", description:"120 Fake Street BR2 911", ppn:"£130")
      space3 = Space.create(space_name: "SPACE", city: "Edinburgh", description:"125 NotThere Street BR2 9ER", ppn:"£150")
      spaces = Space.all
      expect(spaces.length).to eq 4 #inc test addition
      expect(spaces[2].city).to eq "Bristol"
      expect(spaces[1].space_name).to eq "Spacey MsSpacerson"
    end
  end 

  describe '#find' do
    it 'retrieves space from db' do
      space = Space.create(space_name: "Spacey MsSpacerson", city: "London", description: "119 Commerical Street BR1 9ER", ppn:"£125")
      result = Space.find(space_name: space.space_name)
      expect(result.space_name).to eq space.space_name
      # expect(result.city).to eq user.user_name
    end
  end
end 