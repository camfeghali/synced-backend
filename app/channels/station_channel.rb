class StationChannel < ApplicationCable::Channel
  def subscribed
    @station = Station.find_by(id: params[:station_id])
    stream_for @station
  end

  def unsubscribed
    @station.unsubscribe
    # Any cleanup needed when channel is unsubscribed
  end
end
