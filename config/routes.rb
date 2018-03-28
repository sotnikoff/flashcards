Rails.application.routes.draw do
  get 'sign_up', to: 'registrations#new', as: 'sign_up_page'
  post 'registrations', to: 'registrations#create', as: 'sign_up'

  get 'login', to: 'sessions#new', as: 'login_page'
  post 'sessions', to: 'sessions#create', as: 'login'
  delete 'session', to: 'sessions#destroy', as: 'logout'

  scope 'github' do
    get 'new', to: 'github_sessions#new', as: 'github_new'
    get 'callback', to: 'github_sessions#callback', as: 'github_callback'
  end

  resources :cards
  resources :decks
  resources :answers, only: %i[new create]

  root to: 'answers#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
