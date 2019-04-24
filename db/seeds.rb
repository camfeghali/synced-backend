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

array_of_artists = ['Vinnie Paz']
# 'Carlos Santana', 'Diddy', 'Kid Bloom', 'Frank Ocean', 'Car Seat Headrest', 'Hozier', 'Sufjan Stevens', 'DAOKO', 'JAY Z', 'Lenny Kravitz', 'Eminem', 'Beyonce', 'Damian Marley', 'Bob Marley', 'Leon Bridges', 'Lady Gaga', 'Bruno Mars', 'Sam Smith', 'NAS']


array_of_artists.each do |artist|
  spotify_artist = RSpotify::Artist.search(artist).first
  puts "#{spotify_artist.name} has been found"
  puts "#{spotify_artist.name}'s cover image: #{spotify_artist.images[1]['url']}"
  [spotify_artist.albums.first].each do |album|
    sleep(0.5)
    puts " --- Album name: #{album.name} --- "
    puts " --- Album cover art: #{album.images[2]['url']} --- "
    album.tracks.each do |track|
      sleep(0.5)
      puts " --- Song name: #{track.name} --- "
      puts " --- Image URL: #{spotify_artist.images[1]['url']} --- "
      puts " --- Preview URL: #{track.preview_url} --- "
    end
  end
end

artists = RSpotify::Artist.search('Vinnie Paz')
vinnie_p = artists.first

vinnie_p_albums = vinnie_p.albums

# puts "artist: #{vinnie_p.name} - popularity: #{vinnie_p.popularity} - genres: #{vinnie_p.genres}"


# vinnie_p_albums.each do |album|
#   puts "name: " + album.name
#   # images[0] => 640x640 - [1] => 300x300 - [2] => 64x64
#   puts album.images[0]["url"]
# end

puts "Done seeding"
