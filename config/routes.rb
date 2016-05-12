Rails.application.routes.draw do
  get 'fb_auth', to: 'messagess#fb_auth'
  post 'fb_auth', to: 'messages#create'
end
