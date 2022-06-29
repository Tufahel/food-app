Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
  resources :foods, only: [:index, :create, :show, :destory]
  resources :recipes, only: [:index, :create, :show, :destory] do
    resources :recipe_foods, only: [:create, :destory] 
    end
  resources :public_recipes, only: [:create, :destory] 
  resources :general_shopping_list, only: [:create, :destory]  


end
