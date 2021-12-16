Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :adherents
  resources :etablissements
  get 'effacer_adherent', to: 'adherents#effacer_adherent'
  get 'effacer_etablissement', to: 'etablissements#effacer_etablissement'
  get 'pages/admin'
  get 'pages/client'
  get 'pages/pcr'
end
