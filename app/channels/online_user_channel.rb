class OnlineUserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_user"
    # byebug
  end

  def unsubscribed
    raise "huh?"
    # self.unsubscribe
    # Any cleanup needed when channel is unsubscribed
  end
end
