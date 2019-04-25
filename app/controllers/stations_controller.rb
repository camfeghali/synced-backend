class StationsController < ApplicationController

  def index
    stations = Station.all
    render json: stations
  end

  def show
    station = Station.find(params["id"])
    render json: station
  end

  def create
    station = Station.create(host_id: 1, name: "my first station", song_id: 4, timestamp:26.4836, playing: false)
    all_stations = Station.all
    ActionCable.server.broadcast("lobby", {stations: all_stations})
    # byebug
    render json: station
  end

  def update
    # byebug
    station = Station.find(params["id"])
    state = {
      song_url: params["song_url"],
      timestamp: params["timestamp"],
      playing: params["playing"]
    }
    StationChannel.broadcast_to(station, state)
    render json: station
  end

end
