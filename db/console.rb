require('pry')
require_relative('../models/albums')
require_relative('../models/artists')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({ "name" => "Snake Hips" })
artist1.save()

artist2 = Artist.new({ "name" => "Belching Bill" })
artist2.save()

artist3 = Artist.new({ "name" => "Fast Hands Eddie" })
artist3.save()

album1 = Album.new({ "records_sold" => "50m",
  "album_name" => "Snakey Snake",
  "artist_id" => artist1.id

})
album1.save()

album2 = Album.new({ "records_sold" => "10m",
  "album_name" => "8 Cans a Day",
  "artist_id" => artist2.id
})
album2.save()

album3 = Album.new({ "records_sold" => "25m",
  "album_name" => "Stairway to Hell",
  "artist_id" => artist3.id
})
album3.save()

artist1.name = "Mr Smooth"
artist1.update()
# artists = Artist.all()
# Artist.find_by_id(1)

# god knows what i've done but i totally messed things up and it got far too
# late in the day to get things completed, what started off well turned into
# a nightmare of errors!!! :(
binding.pry
nil
