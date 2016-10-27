Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: :new
  resources :cards
  resources :collections
  resources :collector
  get '/register' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'


end
