DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE album (
  id SERIAL4 PRIMARY KEY,
  records_sold VARCHAR(255),
  album_name VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)

)
