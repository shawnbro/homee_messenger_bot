Rails.application.routes.draw do
  get 'fb_auth', to: 'messages#fb_auth'
  post 'fb_auth', to: 'messages#create'

  resources :users, only: [:show]
end
