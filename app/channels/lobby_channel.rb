class LobbyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "lobby"
  end

  def unsubscribed
    raise "huh?"
    # self.unsubscribe
    # Any cleanup needed when channel is unsubscribed
  end
end
