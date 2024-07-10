Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  # Contents
  resources :contents
  get "publish/:id", to: "contents#publish_content", as: :publish
  get "unpublish/:id", to: "contents#unpublish_content", as: :unpublish
  get "toValidate", to: "contents#contents_to_validate", as: :to_validate

  # Tournaments
  resources :tournaments, only: [:index, :new, :create]
  get "register/:id", to: "tournaments#register", as: :register_tournament
  get "unregister/:id", to: "tournaments#unregister", as: :unregister_tournament
  get "closeRegistrations/:id", to: "tournaments#close_registrations", as: :close_registrations
  get "openRegistrations/:id", to: "tournaments#open_registrations", as: :open_registrations
  get "reopenRegistrations/:id", to: "tournaments#reopen_registrations", as: :reopen_registrations

  # SWGOH.GG API
  get "getPlayerInfos", to: "swgoh_api#get_player_infos"
end
