CREATE TABLE spaces(space_id SERIAL PRIMARY KEY, space_name TEXT), city VARCHAR(250), description TEXT, ppN VARCHAR(100), user_id INT REFERENCES users(id));
