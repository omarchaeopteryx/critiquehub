Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # post 'comment', to: 'comments#create'

  get 'movies', to: 'movies#index'

  resources :movies do
    resources :reviews do
      resources :comments
    end
  end

  root "reviews#index"
  post "movies/search", to: 'movies#search', as: :search_movies
end
