Rails.application.routes.draw do
  resources :discussions, only: [:index, :new, :create, :show]
  resources :posts, only: [:edit, :update, :create]
end
