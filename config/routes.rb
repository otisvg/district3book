Rails.application.routes.draw do
  devise_for :users
   root to: "posts#index"
  resources :posts

  namespace :api do
    namespace :v1 do
      resources :users
      resources :posts, only: [:create, :edit, :destroy]
    end
  end

  get '#path', to: 'homepage#index', via: :all          
end
