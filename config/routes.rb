Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/trainers', to: 'trainers#index'
  get '/trainers/:id', to: 'trainers#show'
  get '/digimons', to: 'digimons#index'
  get '/digimons/:id', to: 'digimons#show'
end
