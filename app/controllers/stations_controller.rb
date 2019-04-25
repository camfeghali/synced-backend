class StationsController < ApplicationController

  def index
    stations = Station.all
    render json: stations
  end

  def create
    station = Station.create(host_id: 1, name: "my first station", song_id: 4, timestamp:26.4836, playing: false)
    all_stations = Station.all
    ActionCable.server.broadcast("lobby", {stations: all_stations})
    # byebug
    render json: @station
  end

  def update
    station = Station.find(params["id"])
    StationChannel.broadcast_to(station, {cat: "lol"})
    render json: station
  end

end
