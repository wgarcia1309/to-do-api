Rails.application.routes.draw do
  Rails.application.routes.draw do
    resource :users, only: [:create, :update,:destroy] do
      delete "/task", to: "tasks#delete"
      resources :tasks 
    end
    
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
  end
  
end
