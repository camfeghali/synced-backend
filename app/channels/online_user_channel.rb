class OnlineUserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_user"
    puts " =========== params in subscribed are: #{params} =========="
    # byebug
  end

  def unsubscribed
    raise "huh?"
    # self.unsubscribe
    # Any cleanup needed when channel is unsubscribed
  end
end
