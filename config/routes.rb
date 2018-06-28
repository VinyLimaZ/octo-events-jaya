# frozen_string_literal: true

Rails.application.routes.draw do
  post '/', to: 'issues#create'
  resources :issues, only: [] do
    get 'statistics', to: 'issues#statistics', on: :collection
    get 'events', to: 'events#index', on: :member
  end
end
