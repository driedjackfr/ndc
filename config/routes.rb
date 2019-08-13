Rails.application.routes.draw do
  root 'posts#index'

  get :vuejs,     to: 'funs#vuejs'
  get :dashboard, to: 'funs#dashboard'
  get :caro,      to: 'funs#caro'
  get :today, to: 'tils#today'

  devise_for :admins
  devise_for :guests

  resources :posts, only: %i(index show) do
    resources :comments, only: %i(create destroy)
  end
  resources :tils, only: %i(index show)

  namespace :admin do
    resources :posts, only: %i(new create edit update destroy) do
      collection do
        get :preview
      end
    end
    resources :tlg_messages, only: %i(new create)
  end

  namespace :tlg do
    post :hook, to: 'bots#hook'
  end
end
