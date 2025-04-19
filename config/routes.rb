Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }

  get 'render/index'
  get "up" => "rails/health#show", as: :rails_health_check

  resources :blogs, only: [:new, :create, :index, :show] do
    resources :reviews, only: [:new, :create, :index, :show]
    resources :requests, only: [:new, :create, :index, :show]
  end
  
  resources :information_pages, only: [:new, :create, :index, :show] do
    resources :reviews, only: [:new, :create, :index, :show]
    resources :requests, only: [:new, :create, :index, :show]
  end


  root "render#index"
end
