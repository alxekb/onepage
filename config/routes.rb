# frozen_string_literal: true

Rails.application.routes.draw do
  root 'calc#show'

  namespace :api do
    namespace :v1 do
      post 'equation', to: 'calc#equation'
      get 'equation', to: 'calc#user'
      post 'sign_up', to: 'registrations#sign_up'
    end
  end

  get '*page', to: 'calc#show', constraints: lambda { |req|
    !req.xhr? && req.format.html?
  }
end
