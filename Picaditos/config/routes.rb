Rails.application.routes.draw do

  resources :requests
  #root :to => 'users#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]


  get 'sessions/create'

  get 'sessions/destroy'

  get "pdfs/show", to:  "pdfs#show"
  get "pdfs/show_deporte", to:  "pdfs#show_deporte"
  get "pdfs/show_estadistica", to:  "pdfs#show_estadistica"
  get "equipos/my_team", to: "equipos#my_team"
  get "torneos/my_tournaments", to: "torneos#my_tournaments"
  get "torneos/search", to:  "torneos#name_tournaments"
  get "canchas/canchas_disp", to: "canchas#canchas_disp"
  post 'user_sign_in/google', to: 'user_sign_in#googlesign'
  get "estadisticas/my_stats", to: 'estadisticas#my_stats'
  get "mensajes/my_messages", to: "mensajes#my_messages"
  post 'user_token' => 'user_token#create'
  resources :ubicacions
  resources :torneos
  resources :mensajes
  resources :estadisticas
  resources :canchas
  resources :partidos
  resources :deportes
  resources :anuncios
  resources :tablons
  resources :equipos
  resources :items
  #resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/' do
    resources :users
    post 'user_token' => 'user_token#create'
  end


end
