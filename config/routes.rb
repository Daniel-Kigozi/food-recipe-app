Rails.application.routes.draw do
  root to: 'recipes#index'
devise_for :users, controllers: {
registrations: 'users/registrations'
}
resources :shopping_lists, only: [:index]
get '/public_recipes', to: 'recipes#public_recipes'
  
get 'welcome', to: 'pages#welcome'
get 'about', to: 'pages#about'


   resources :foods
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
   end
end
