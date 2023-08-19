Rails.application.routes.draw do
  get 'welcome', to: 'pages#welcome'
  get 'about', to: 'pages#about'
 
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'foods#index'
  resources :shopping_lists, only: [:index]

  resources :foods
end
