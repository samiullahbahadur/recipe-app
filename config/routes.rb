Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/new'
  get 'foods/index'
  get 'foods/new'
  #get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  devise_for :users
  #root 'users#index'
  resources :users
  resources  :foods 
  resources :recipes
  resources :recipe_foods
end
