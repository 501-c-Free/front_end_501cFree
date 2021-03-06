Rails.application.routes.draw do
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/non_profits/new"
  get "/non_profit", to: 'non_profits#show'
  post "/non_profits/create"
  resources :representatives, only: [:new, :create]
  get "/developers/new"
  post "/developers/create"
  get '/developer', to: 'developers#show'
  get '/developer/edit', to: 'developers#edit'
  patch '/developer', to: 'developers#update'
  get '/developers', to: "developers#index"

  get "/auth/google_oauth2", to: "sessions#new"
  get "/auth/google_oauth2/callback", to: "sessions#create"

  get '/calendar', to: 'calendars#show'
  get '/oauth/callback', to: 'calendars#create'

  get "/non_profit/dashboard", to: 'non_profits#index'
  get "user_choice", to: "welcome#show"
  resources :projects, only: [:create, :index, :show, :edit, :update]
  get "/project/:id", to: "projects#show"
  get "/log_in", to: "sessions#new"
  post "/log_in", to: "sessions#create"
  delete "/log_out", to: "sessions#destroy"



end
