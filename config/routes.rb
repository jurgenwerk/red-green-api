Rails.application.routes.draw do
  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get '/users/me', to: 'users#me'
      resource :users
      resources :balance_changes
    end
  end
end
