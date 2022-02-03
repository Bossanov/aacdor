Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :adherents
  resources :pcrs
  resources :etablissements
  resources :messages
  resources :generateurbases
  resources :capteurbases
  resources :medecins
  resources :personnels
  get 'effacer_adherent', to: 'adherents#effacer_adherent'
  get 'effacer_etablissement', to: 'etablissements#effacer_etablissement'
  get 'effacer_message', to: 'messages#effacer_message'
  get 'effacer_generateurbase', to: 'generateurbases#effacer_generateurbase'
  get 'effacer_capteurbase', to: 'capteurbases#effacer_capteurbase'

  get 'effacer_pcr', to: 'pcrs#effacer_pcr'
  get 'effacer_medecin', to: 'medecins#effacer_medecin'
  get 'effacer_personnel', to: 'personnels#effacer_personnel'

  get 'retirer_pcr', to: 'adherents#retirer_pcr'

  get 'pages/admin'
  get 'pages/client'
  get 'pages/pcr'
  get '/search', to: 'search#result'

end
