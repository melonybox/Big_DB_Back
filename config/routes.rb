Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users

      get "/userlist/:amount/:page", to: "users#user_list"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
