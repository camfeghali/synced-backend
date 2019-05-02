class PlaylistChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # byebug
    @playlist = Playlist.find_by(id: params[:playlistId])
    stream_for @playlist
  end

  def unsubscribed
    raise "huh?"
    # Any cleanup needed when channel is unsubscribed
  end
end
