require_relative("../db/sql_runner")
require_relative("../models/albums")


class Artist

  attr_accessor :name, :id

  def initialize(options)
    @name = options["name"]
    @id = options["id"].to_i
  end

  def save
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1)
    RETURNING *"
    values = [@name]
    SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM artists"
    artist = SqlRunner.run(sql)
    result = artist.map { |artists| Artist.new(artists)}
    return result
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    artist = self.new(result.first)
    return artist
  end

  def find_album
    sql = "SELECT * FROM album WHERE artist_id = $1"
    values = [@id]
    found_albums = SqlRunner.run(sql, values)
    results = found_albums.map { |albums| Album.new(albums) }
    return results
  end
end
