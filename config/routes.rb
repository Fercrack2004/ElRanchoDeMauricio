Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register',
    edit: 'edit_profile'
  }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  get 'render/index'
  get "up" => "rails/health#show", as: :rails_health_check
  resources :subscribers, only: [:create]
  resources :users, only: [:index, :show, :destroy, :edit, :update]

  resources :blogs do
    resources :reviews
    resources :requests
    resources :chat_rooms do
      resources :messages
    end
  end
  
  resources :information_pages do
    resources :reviews
    resources :requests
    resources :chat_rooms do
      resources :messages
    end
  end

  root "render#index"
end