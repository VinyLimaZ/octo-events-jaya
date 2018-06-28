# frozen_string_literal: true

Rails.application.routes.draw do
  post '/', to: 'issues#create'
  resources :issues, only: [] do
    get 'events', to: 'events#index', on: :member
    get 'statistics', to: 'event#statistcs', on: :collection
  end
end
