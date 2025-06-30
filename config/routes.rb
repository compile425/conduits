Rails.application.routes.draw do
  root "articles#index"
  resources :articles
  get "/users/sign_up", to: "registrations#new", as: "new_user_registration"
  post "/users", to: "registrations#create", as: "user_registration"
  get "/users/sign_in", to: "sessions#new", as: "new_user_session"
  post "/users/sign_in", to: "sessions#create", as: "user_session"
  delete "/users/sign_out", to: "sessions#destroy", as: "destroy_user_session"
end
