Rails.application.routes.draw do
  root 'posts#index'

  get :vuejs,     to: 'funs#vuejs'
  get :dashboard, to: 'funs#dashboard'
  get :caro,      to: 'funs#caro'

  devise_for :admins
  devise_for :guests

  resources :posts, only: %i(index show)

  namespace :admin do
    resources :posts, only: %i(new create edit update destroy)
  end
end
