Rails.application.routes.draw do


  get '/' => 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :owners
  resources :users, except: [:new, :show]
  get '/home' => 'users#show', as: :home
  resources :cards
  post '/choose_card' => 'cards#choose'
  resources :brands
  resources :decks, except: [:index]
  get '/brands/:id/new' => "decks#new"
  get '/owners/:id/decks' => 'decks#index', as: :see_decks
  get '/register' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  post '/delete_card' => 'cards#destroy'
  post '/cards/new' => 'cards#new'

end
