Rails.application.routes.draw do

  get '/' => 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :owners
  resources :users, except: :new
  resources :cards
  resources :brands
  get '/register' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/delete_card' => 'cards#destroy'


end
