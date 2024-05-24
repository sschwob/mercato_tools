Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :medium, only: [:index]
end
