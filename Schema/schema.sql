CREATE TABLE item (
    id INTEGER PRIMARY KEY,
    source VARCHAR(255),
    label VARCHAR(255),
    genre_id INTEGER,
    author_id INTEGER
);

CREATE TABLE book (
    id INTEGER PRIMARY KEY,
    item_id INTEGER,
    ISBN VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES item(id)
);