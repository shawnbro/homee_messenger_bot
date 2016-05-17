Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'fb_auth', to: 'messages#fb_auth'
      post 'fb_auth', to: 'messages#create'
      resources :users, only: [:show]
    end
  end
end
