Rails.application.routes.draw do
  get 'recipe_foods/index'
  get 'recipe_foods/new'
  get 'public_recipes/index'
  devise_for :users

  resources :users, only: :index do
    resources :recipes, except: [:edit, :update] do
      resources :recipe_foods, only: [:index, :new, :create, :destroy]
    end
    resources :foods, except: [:edit, :update]
  end
  resources :public_recipes, only: :index
  # Defines the root path route ("/")
  root 'public_recipes#index'
end
