# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :players

  resources :dashboards, only: :index
  resources :games, only: %i[new create show]

  root to: "dashboards#index"
end
