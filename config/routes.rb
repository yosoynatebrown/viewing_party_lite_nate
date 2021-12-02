Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/register', to: 'users#new'
  # get '/users/:user_id/movies/:movie_id/viewing-party/new', to: 'viewing_parties#new'

  resources :users, only: [:create]
  resources :users, only: [:show] do
    resources :discover, only: [:index]
    resources :movies, only: [:show] do
      resources :viewing_parties, only: [:new, :create]
    end
  end

  
end
