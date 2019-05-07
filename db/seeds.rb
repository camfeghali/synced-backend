# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Started seeding"
require 'rspotify'


RSpotify.authenticate(ENV["CLIENT_ID"], ENV["CLIENT_SECRET"])
array_of_artists = ['Vinnie Paz', 'Carlos Santana', 'Diddy', 'Kid Bloom', 'Frank Ocean', 'Car Seat Headrest', 'Hozier', 'Sufjan Stevens', 'DAOKO', 'JAY Z', 'Lenny Kravitz', 'Eminem', 'Beyonce', 'Damian Marley', 'Bob Marley', 'Leon Bridges', 'Lady Gaga', 'Bruno Mars', 'Sam Smith', 'NAS']



array_of_artists.each do |artist|
  spotify_artist = RSpotify::Artist.search(artist).first
  this_artist = Artist.create(name: spotify_artist.name, image_url: spotify_artist.images[1]['url'])
  puts "#{spotify_artist.name} has been found"
  puts "#{spotify_artist.name}'s cover image: #{spotify_artist.images[1]['url']}"
  [spotify_artist.albums.first].each do |album|
    sleep(0.5)
    this_album = Album.create(title: album.name, artist_id: this_artist.id, image_url: album.images[2]['url'])
    puts " --- Album name: #{album.name} --- "
    puts " --- Album cover art: #{album.images[2]['url']} --- "
    album.tracks.each do |track|
      sleep(1)
      this_song = Song.create(name: track.name, album_id: this_album.id, preview_url: track.preview_url, image_url: spotify_artist.images[1]['url'])
      this_song.save
      puts "Last song saved: #{Song.all.last}"
      puts "#{this_song} CREATED!"
      puts " --- Song name: #{track.name} --- "
      puts " --- Image URL: #{spotify_artist.images[1]['url']} --- "
      puts " --- Preview URL: #{track.preview_url} --- "
    end
  end
end

puts "Done seeding"
