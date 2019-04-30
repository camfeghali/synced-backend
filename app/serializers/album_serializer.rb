class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :image_url, :songs

  def songs
    self.object.songs
  end
end
