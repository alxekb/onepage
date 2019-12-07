Rails.application.routes.draw do
  root 'calc#show'

  get '/login', to: 'auth#new'
  post '/login', to: 'auth#create'
end
