Rails.application.routes.draw do
	root "articles#index"
	get "/articles", to: "articles#index"
	resources :articles
  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
	#post '/articles/new', to: 'articles#new'
	#patch '/articles/:id', to: 'articles#update'
	#delete '/articles/:id', to: 'articles#delete'
end
