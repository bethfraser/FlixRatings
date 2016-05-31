DROP TABLE rankings;
DROP TABLE films;


CREATE TABLE films(
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  year INT4,
  imdb_rating FLOAT4,
  summary TEXT,
  poster_image VARCHAR(255)
);

CREATE TABLE rankings(
  id serial4 PRIMARY KEY,
  film_id int4 references films(id) ON DELETE CASCADE,
  ranking INT4,
  comments TEXT,
  name VARCHAR(255)
);