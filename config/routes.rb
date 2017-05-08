Rails.application.routes.draw do
	root to: 'sessions#new'
	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')
	get 'signout', to: 'sessions#destroy', as: 'signout'
	get 'index', to: 'sessions#index', as:'index'
	get 'inbox', to: 'inbox#index', as:'inbox'

	resources :sessions, only: [:create, :destroy]
end
