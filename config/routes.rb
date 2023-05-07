Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :tasks

  resources :tasks do
    resources :solutions
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
