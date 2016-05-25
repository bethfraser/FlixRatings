DROP TABLE rankings;
DROP TABLE films;


CREATE TABLE films(
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  year INT4,
  imdb_rating INT4,
  summary VARCHAR(255),
  poster_image VARCHAR(255)
);

CREATE TABLE rankings(
  id serial4 PRIMARY KEY,
  film_id int4 references films(id),
  ranking INT4,
  comments VARCHAR(255),
  name VARCHAR(255)
);