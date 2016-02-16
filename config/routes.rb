Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
  	authenticated :user do
      root 'dashboards#index', as: :authenticated_root
    end

    unauthenticated do
      root 'sign_ups#new', as: :unauthenticated_root
    end
  end

  resources :dashboards, only: [:index, :show]

  get '/sign_up', to: 'sign_ups#new', as: 'new_sign_up'
  post '/sign_up', to: 'sign_ups#create', as: 'create_sign_up'
  get '/search' => 'dashboards#search'

end
