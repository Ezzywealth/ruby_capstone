CREATE TABLE book (
    id INTEGER PRIMARY KEY,
    source_id INTEGER,
    label_id INTEGER REFERENCES label(id),
    genre_id INTEGER,
    author_id INTEGER,
    published_date INTEGER,
    archived BOOLEAN,
    publisher VARCHAR,
    cover_state VARCHAR,
);

CREATE TABLE labels (
    id INTEGER PRIMARY,
    title VARCHAR,
    color VARCHAR,
)