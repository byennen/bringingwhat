BringingwhatCom::Application.routes.draw do
  
  get "authorize" => 'authorize#start'
  get "auth_callback" => 'authorize#callback'
  
  root :to => "welcome#index"

end
