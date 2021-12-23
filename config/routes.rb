Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :adherents
  resources :pcrs
  resources :etablissements
  resources :messages
  get 'effacer_adherent', to: 'adherents#effacer_adherent'
  get 'effacer_etablissement', to: 'etablissements#effacer_etablissement'
  get 'effacer_message', to: 'messages#effacer_message'
  get 'effacer_pcr', to: 'pcrs#effacer_pcr'
  get 'retirer_pcr', to: 'adherents#retirer_pcr'
  get 'pages/admin'
  get 'pages/client'
  get 'pages/pcr'
  post '/search', to: 'search#run'

end
