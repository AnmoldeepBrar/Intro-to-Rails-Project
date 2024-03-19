# Rails.application.routes.draw do
#   get 'magazines/show_all'
#   get 'books/show_all'
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end

Rails.application.routes.draw do
  root 'home#index'

  get 'about', to: 'about#index'
  get 'books', to: 'books#show_all'
  get 'magazines', to: 'magazines#show_all'

  resources :books, only: [:show] do
    resources :magazines, only: [:show], controller: 'books/magazines'
  end

  resources :magazines, only: [:show]

  # Routes for showing the search
  resources :books do
    collection do
      get 'show_all' # Define custom route for show_all action
    end
  end

  resources :magazines do
    collection do
      get 'show_all' # Define custom route for show_all action
    end
  end

end
