# frozen_string_literal: true

Rails.application.routes.draw do
  post '/', to: 'api/v1/issues#create'
  resources :issues, only: [] do
    get 'statistics', to: 'api/v1/issues#statistics', on: :collection
    get 'events', to: 'api/v1/events#index', on: :member
  end
end
