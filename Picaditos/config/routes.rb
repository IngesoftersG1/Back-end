Rails.application.routes.draw do
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
  resources :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
