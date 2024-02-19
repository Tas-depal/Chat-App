# frozen_string_literal: true

Rails.application.routes.draw do
  # root path
  root 'rooms#index'

  # user routes
  resources 'users'

  # session routes
  resources 'sessions'

  # room routes
  resources 'rooms' do
    resources 'messages'
  end
end
