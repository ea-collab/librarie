Library::Application.routes.draw do
  
  
  get "myreservations/index"

  get "home/show"

  get "log_in"  => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new",    :as => "sign_up"
  get "log_out" => "sessions#destroy", :as => "log_out"
  
  resources :users
  resources :sessions
  resources :profiles
  resources :myreservations
  
  resources :books do
    collection do
      get :search
    end
    resources :reservations, only: [:create, :new] do
      member do
        put :free
      end
    end
  end
  
  match 'facebooks/index'
  match 'facebooks/login'
  match 'facebooks/logout'
  match 'facebooks/callback'
  match 'facebooks/menu'

  
  #root :to => 'books#index'
  root :to => 'books#index'

end
