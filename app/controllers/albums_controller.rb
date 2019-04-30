class AlbumsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :update]

  def index
    puts "IN INDEX ACTION OF ARTISTS CONTROLLER"
    albums = Album.all.select do |album|
      album.title.downcase.include?(params["searchTerm"].downcase)
    end
    # render json: Album.all
    render json: albums
  end

end
