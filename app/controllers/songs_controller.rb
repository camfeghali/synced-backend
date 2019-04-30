class SongsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :update]

  def index
    puts "IN INDEX ACTION OF ARTISTS CONTROLLER"
    songs = Song.all.select do |song|
      song.name.downcase.include?(params["searchTerm"].downcase)
    end
    # byebug
    render json: songs
  end

end
