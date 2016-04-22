Rails.application.routes.draw do
  use_doorkeeper
  root to: "application#index"

  namespace :api do
    namespace :v1 do
      root to: "base#index"
      get '/users/me', to: 'users#me'
      resources :users
      resources :balance_changes
    end
  end
end
