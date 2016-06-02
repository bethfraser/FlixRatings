DROP TABLE rankings;
DROP TABLE films;
DROP TABLE users;


CREATE TABLE films(
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  year INT4,
  imdb_rating FLOAT4,
  summary TEXT,
  poster_image TEXT
);

CREATE TABLE users(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  password VARCHAR(255),
  current_user_status CHAR(1)
);

CREATE TABLE rankings(
  id serial4 PRIMARY KEY,
  user_id int4 references users(id) ON DELETE CASCADE,
  first_film_id int4 references films(id) ON DELETE CASCADE,
  second_film_id int4 references films(id) ON DELETE CASCADE,
  third_film_id int4 references films(id) ON DELETE CASCADE,
  decade INT4,
  comments TEXT
);

