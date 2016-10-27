Rails.application.routes.draw do
  get 'collector/new'

  get 'collector/show'

  get 'collector/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :cards
  resources :collections
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'


end
