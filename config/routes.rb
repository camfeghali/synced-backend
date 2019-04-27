Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/get_user', to: 'users#get_user'
  resources :songs
  resources :artists
  resources :songs
  resources :albums
  resources :stations
  get '/stations/:id', to: 'patients#join'
  mount ActionCable.server => '/cable'

end
