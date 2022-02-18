Rails.application.routes.draw do
  resources :discussions, only: [:index, :show]
end
