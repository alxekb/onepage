Rails.application.routes.draw do
  #use_doorkeeper
  root 'calc#show'

  get '/login', to: 'auth#new'
  post '/login', to: 'auth#create'

  namespace :api do
    namespace :v1 do
      post 'equation', to: 'calc#equation'
      get 'equation', to: 'calc#user'
      post 'sign_up', to: 'registrations#sign_up'
    end
  end
end
