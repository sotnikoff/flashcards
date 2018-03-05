Rails.application.routes.draw do

  resources :cards
  resources :answers, only: %i[new create]

  root to: 'answers#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
