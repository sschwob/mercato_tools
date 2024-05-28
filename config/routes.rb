Rails.application.routes.draw do
  devise_for :users
  root to: "tournaments#index"
  
  resources :medium, only: [:index]
  resources :tournaments, only: [:new, :create]
  get "register/:id", to: "tournaments#register", as: :register_tournament
  get "unregister/:id", to: "tournaments#unregister", as: :unregister_tournament

  get "getPlayerInfos", to: "swgoh_api#get_player_infos"
end
