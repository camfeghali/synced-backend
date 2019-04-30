class ArtistsController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :index, :update]

  def index
    puts "IN INDEX ACTION OF ARTISTS CONTROLLER"
    artists = Artist.all.select do |artist|
      artist.name.downcase.include?(params["searchTerm"].downcase)
    end
    # byebug
    render json: artists
  end
end
