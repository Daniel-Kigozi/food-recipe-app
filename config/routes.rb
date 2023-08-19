Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipe_foods
  resources :recipes
  # Defines the root path route ("/")
  root to: 'foods#index'

  resources :foods, only: [:index] do
  end
end
