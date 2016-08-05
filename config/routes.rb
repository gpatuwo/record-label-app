Rails.application.routes.draw do
  resources :users
  resource :session
  resources :bands
  resources :albums, except: :index
  resources :tracks, except: :index
end
