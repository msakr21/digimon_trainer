Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/trainers', to: 'trainers#index'
  get '/trainers/new', to: 'trainers#new'
  post'/trainers', to: 'trainers#create'
  get '/trainers/:id', to: 'trainers#show'
  get '/digimons', to: 'digimons#index'
  get '/digimons/:digimon_id/edit', to: 'digimons#edit'
  patch '/digimons/:id', to: 'digimons#update'
  get '/digimons/:id', to: 'digimons#show'
  get '/trainers/:trainer_id/edit', to: 'trainers#edit'
  patch '/trainers/:id', to: 'trainers#update'
  get '/trainers/:trainer_id/digimons/new', to: 'trainer_digimons#new'
  get '/trainers/:trainer_id/digimons', to: 'trainer_digimons#index'
  post'/trainers/:trainer_id/digimons', to: 'trainer_digimons#create'
end
