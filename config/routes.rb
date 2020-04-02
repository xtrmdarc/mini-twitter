Rails.application.routes.draw do
  get 'tweets/new'
  get 'tweets/index'
  get 'tweets/create'
  post '/login',        to:'sessions#create'
  get '/login',         to:'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets, only: [ :new, :create, :index ]
end
