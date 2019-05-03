class StationsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :show, :index, :update, :destroy, :edit, :new, :delete]


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
    if params["joining"]
      # byebug
      station = Station.find(params["stationId"])
      state = {
        joining: true
      }
      puts "------------ ON JOIN BROADCASTING THE FOLLOWING STATE: #{state}"
      puts "------------ TO THIS STATION ID: #{station.id}"
      StationChannel.broadcast_to(station, state)
    else
      station = Station.find(params["id"])
      # byebug
      state = {
        trackName: params["trackName"],
        trackUrl: params["trackUrl"],
        timestamp: params["timestamp"],
        playing: params["playing"]
      }
      # byebug
      puts "------------ ON SYNC BROADCASTING THE FOLLOWING STATE: #{state}"
      # byebug
      StationChannel.broadcast_to(station, state)
      render json: {flag: false}
    end


  end

  def destroy

  end

  def delete
    host = User.find_by(username: params["username"])
    station = Station.find_by(host_id: host.id)
    # byebug
    station.delete
    all_stations = Station.all
    ActionCable.server.broadcast("lobby", {stations: all_stations})
    # byebug
    render json: station
  end




end
