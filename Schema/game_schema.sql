CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date date,
  archived boolean,
  multiplayer boolean,
  last_played_at date,
    CONSTRAINT genre_id
    FOREIGN KEY(genre_id)
      REFERENCES genre(id)
      ON DELETE CASCADE,
  CONSTRAINT source_id
    FOREIGN KEY(source_id)
      REFERENCES source(id)
      ON DELETE CASCADE,
  CONSTRAINT author_id
    FOREIGN KEY(author_id)
      REFERENCES author(id)
      ON DELETE CASCADE,
  CONSTRAINT label_id
    FOREIGN KEY(label_id)
      REFERENCES label(id)
      ON DELETE CASCADE
);

CREATE INDEX author_id_asc_games ON games(author_id ASC);
CREATE INDEX source_id_asc_games ON games(source_id ASC);
CREATE INDEX genre_id_asc_games ON games(genre_id ASC);
CREATE INDEX label_id_asc_games ON games(label_id ASC);