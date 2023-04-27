CREATE TABLE game (
  id SERIAL PRIMARY KEY,
  source_id INTEGER,
  label_id INTEGER ,
  genre_id INTEGER,
  author_id INTEGER REFERENCES author(id),
  published_date INTEGER,
  multiplayer VARCHAR,
  last_played_at VARCHAR,
)

CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
)