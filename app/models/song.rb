class Song < ApplicationRecord
  belongs_to :album
  has_many :song_playlists
  has_many :playlists, through: :song_playlists
end
