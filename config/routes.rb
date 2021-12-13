Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :adherents
  get 'effacer_adherent', to: 'adherents#effacer_adherent'
  get 'pages/admin'
  get 'pages/client'
  get 'pages/pcr'
end
