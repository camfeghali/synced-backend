class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :album, :preview_url, :image_url, :artist

  def album
    self.object.album.title
  end

  def artist
    self.object.album.artist.name
  end

end
