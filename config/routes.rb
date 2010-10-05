BringingwhatCom::Application.routes.draw do
  
  get "user_sessions/new"

  #dashboard
  get "dashboard/index"

  resources :events
  resources :user_sessions

  #login
  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  
  #facebook
  get "authorize" => 'authorize#start'
  get "auth_callback" => 'authorize#callback'
  
  #welcome page
  root :to => "welcome#index"

end
