Rails.application.routes.draw do
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
  devise_for :users

  resources :recipes, only: [:create, :index, :destroy, :show, :new]

  root 'recipes#index'
end


# config/routes.rb



# Rails.application.routes.draw do
#   devise_for :users, path: 'auth',
#   path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
#    confirmation: 'verification', unlock: 'unblock', registration: 'register',
#    sign_up: 'cmon_let_me_in' } 
#    devise_scope :user do
#     get '/users/sign_out', to: 'devise/sessions#destroy'
#     root to: 'devise/sessions#new'
#   end
#     # root 'users#index'
# end
