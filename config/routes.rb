Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'

  get  '/login',  to: 'sessions#new'
  post  '/login',  to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources 'users'
  resources 'topics'
  get '/favorites', to: 'favorites#index'
  post '/favorites', to: 'favorites#create'
  get '/comments/new', to: 'comments#new'
  post '/comments', to: 'comments#create'

end
