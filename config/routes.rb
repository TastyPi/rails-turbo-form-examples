Rails.application.routes.draw do
  resources :discussions, only: [:index, :new, :create, :show]
end
