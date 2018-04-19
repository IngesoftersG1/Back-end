Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  
  
  get 'sessions/create'

  get 'sessions/destroy'
  
  get "pdfs/show", to:  "pdfs#show"
  get "pdfs/show_deporte", to:  "pdfs#show_deporte"
  get "equipos/my_team", to: "equipos#my_team"
  
  post 'user_sign_in/google', to: 'user_sign_in#googlesign'
  
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
