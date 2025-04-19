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

  resources :blogs do
    resources :reviews
    resources :requests
  end

  resources :information_pages do
    resources :reviews
    resources :requests
  end

  root "render#index"
end