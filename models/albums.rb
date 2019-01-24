require_relative("../db/sql_runner")
require_relative("../models/artists")
require_relative("../models/artists")

class Album

  attr_accessor :artist_id, :name
  attr_reader :id

  def initialize(options)
    @records_sold = options["records_sold"]
    @album_name = options["album_name"]
    @artist_id = options["artist_id"]
    @id = options["id"].to_i

  end

  def save
    sql = "INSERT INTO album
    (records_sold,
      album_name,
      artist_id)
      VALUES
      (
        $1, $2, $3
      )
      RETURNING id"
      values = [@records_sold, @album_name, @artist_id]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i()
    end

    def update()
      sql = "UPDATE album SET records_sold = $1, album_name = $2,
      artist_id = $3 WHERE id = $4"
      values = [@records_sold, @album_name, @artist_id, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM album WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all
      sql = "DELETE FROM album"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM album"
      SqlRunner.run(sql)
      result = albums.map { |album_hash| Album.new(album_hash )}
      return result
    end

    def find_artist
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)
      artist = Artist.new(results.first)
      return artist
    end

    def albums
      sql = "SELECT * FROM album WHERE artist_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      albums = results.map { |album| Album.new(album) }
      return albums
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM album WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      album = self.new(results)
      return album

    end

  end
