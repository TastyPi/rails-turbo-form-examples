Rails.application.routes.draw do
  resources :discussions, only: [:index, :show]
  resources :posts, only: [:edit, :update]
end
