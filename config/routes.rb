Rails.application.routes.draw do
  scope '/:locale' do
    get 'sign_up', to: 'registrations#new', as: 'sign_up_page'
    post 'registrations', to: 'registrations#create', as: 'sign_up'

    get 'login', to: 'sessions#new', as: 'login_page'
    post 'sessions', to: 'sessions#create', as: 'login'
    delete 'session', to: 'sessions#destroy', as: 'logout'

    resources :cards do
      get 'random_card', on: :collection
    end
    resources :decks
    resources :answers, only: %i[index create]
    resources :users, only: %i[update]

    root to: 'answers#index'
  end

  scope 'github' do
    get 'new', to: 'github_sessions#new', as: 'github_new'
    get 'callback', to: 'github_sessions#callback', as: 'github_callback'
  end

  root to: 'pages#index'
end
