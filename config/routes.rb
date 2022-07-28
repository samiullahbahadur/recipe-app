Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :index do
    resources :foods, except: [:update, :edit, :show] do
      resources :recipe_foods, except: [:update, :edit]
    end
    resources :recipes, except: [:update, :edit]
  end
  # Defines the root path route ("/")
  root 'users#index'
end
