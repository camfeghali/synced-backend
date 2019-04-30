class PlaylistSerializer < ActiveModel::Serializer
  attributes :id , :name, :user_id, :songs

  def songs
    self.object.songs
  end
end
