BringingwhatCom::Application.routes.draw do
  
  #events
  resources :events
  
  
  #dashboard
  match 'dashboard' => 'dashboard#index', :as => :dashboard

  #login
  resources :user_sessions
  match 'login' => 'user_sessions#new',      :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  #signup
  resources :users
  match 'signup' => 'users', :as => :signup
  
  #facebook
  get 'authorize' => 'authorize#start'
  get 'auth_callback' => 'authorize#callback'
  
  #welcome page
  root :to => 'welcome#index'

end
