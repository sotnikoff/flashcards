Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login_page'
  post 'sessions', to: 'sessions#create', as: 'login'
  delete 'session', to: 'sessions#destroy', as: 'logout'

  resources :cards
  resources :answers, only: %i[new create]

  root to: 'answers#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
