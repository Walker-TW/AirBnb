require 'pg'

def setup_test_database
  p "Cleaning test database..."

  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE users, spaces;")
  connection.exec("INSERT INTO spaces (space_name, city, description, ppn) VALUES('pls work', 'sparta', 'fuck xerxes', '300')")
end