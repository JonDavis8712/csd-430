-- Create the database
CREATE DATABASE IF NOT EXISTS csd430;

-- Tell MySQL to use this new database for the next commands
USE csd430;

-- Create the user 'student1' with the password 'pass'

CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';

-- Grant privileges for your user on THIS specific database
GRANT ALL PRIVILEGES ON csd430.* TO 'student1'@'localhost';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;

-- Create the table (using your first name, as per the original instructions)
CREATE TABLE IF NOT EXISTS jon_movies_data (
  movie_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  director VARCHAR(255),
  release_year INT,
  genre VARCHAR(100)
);

-- Insert records into the table
INSERT INTO jon_movies_data (title, director, release_year, genre) VALUES
('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama'),
('The Godfather', 'Francis Ford Coppola', 1972, 'Crime'),
('The Dark Knight', 'Christopher Nolan', 2008, 'Action'),
('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime'),
('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama'),
('Inception', 'Christopher Nolan', 2010, 'Sci-Fi'),
('The Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, 'Sci-Fi'),
('Goodfellas', 'Martin Scorsese', 1990, 'Crime'),
('The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 2001, 'Fantasy'),
('Fight Club', 'David Fincher', 1999, 'Drama');