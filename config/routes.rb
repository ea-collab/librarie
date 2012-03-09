Library::Application.routes.draw do
  
  #get "sessions/new"
  #get "users/new" 
  get "log_in"  => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new",    :as => "sign_up"
  get "log_out" => "sessions#destroy", :as => "log_out"
  resources :users
  resources :sessions

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
  
  #root :to => 'books#index'
  root :to => 'site#index'

end
