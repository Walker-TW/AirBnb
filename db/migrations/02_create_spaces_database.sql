CREATE TABLE spaces(space_id SERIAL PRIMARY KEY, space_name VARCHAR(1000), city VARCHAR(250), description VARCHAR(5000), ppN VARCHAR(100), user_id INT REFERENCES users(id));
