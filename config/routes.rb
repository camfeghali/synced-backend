Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :index]
  post '/login', to: 'auth#create'
  get '/logout', to: 'auth#logout'
  get '/get_user', to: 'users#get_user'
  get '/get_artists', to: 'artists#search'
  get '/get_songs', to: 'songs#search'
  get '/get_albums', to: 'albums#search'
  delete '/remove_song', to: 'playlists#remove_song', as: 'remove_song'
  get '/delete_station', to: 'stations#delete', as: 'delete_station'
  resources :songs
  resources :artists
  resources :songs
  resources :playlists
  resources :albums
  resources :stations
  resources :song_playlists
  get '/stations/:id', to: 'patients#join'
  mount ActionCable.server => '/cable'

end
