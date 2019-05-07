class PlaylistSerializer < ActiveModel::Serializer
  attributes :id , :name, :user_id, :songs

  def songs
    self.object.songs.map do |song|
      song = {
        id: song.id,
        name: song.name,
        album_id: song.album_id,
        preview_url: song.preview_url,
        image_url: song.image_url,
        artist: song.album.artist.name,
        album: song.album.title
      }
    end
  end
end
