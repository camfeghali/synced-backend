Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/get_user', to: 'users#get_user'
  get '/get_artists', to: 'artists#search'
  get '/get_songs', to: 'songs#search'
  get '/get_albums', to: 'albums#search'
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
