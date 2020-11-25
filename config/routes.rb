Rails.application.routes.draw do
  devise_for :users

  mount API::Base, at: "/"

  get '#path', to: 'homepage#index', via: :all
end

