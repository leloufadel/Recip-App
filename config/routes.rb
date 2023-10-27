Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  devise_for :users

  resources :recipes, only: [:create, :index, :destroy, :show, :new, :update] do
    get 'public_recipes', on: :collection
    resources :recipe_foods, only: [:new, :create, :show, :destroy]
  end

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :shopping_lists, only: [:index]

  root 'recipes#index'
end
