CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN DEFAULT FALSE,
    genre VARCHAR(100),  
    author VARCHAR(100),
    source VARCHAR(100),
    label VARCHAR(100),
    album_id INT
    FOREIGN KEY (album_id) REFERENCES music_album(id) 
);

CREATE TABLE music_album (
    id SERIAL PRIMARY KEY,
    artist VARCHAR(100),
    title VARCHAR(100),
    on_spotify BOOLEAN DEFAULT FALSE,
    genre VARCHAR(100)
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    items VARCHAR(100)
);