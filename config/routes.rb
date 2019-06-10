Rails.application.routes.draw do
  root 'posts#index'

  devise_for :admins

  resources :posts, only: %i(index show)

  namespace :admin do
    resources :posts, only: %i(new create edit update destroy)
  end
end
