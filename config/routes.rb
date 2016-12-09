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
      resources :comments, only: [:new, :create]
    end
  end

  root "reviews#index"

end
