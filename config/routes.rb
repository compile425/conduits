Rails.application.routes.draw do
  root "conduits#home"

  get "/articles/new", to: "conduits#new_article", as: "new_article"

  post "/articles/create", to: "conduits#create_article", as: "create_article"

  get "/articles/:id", to: "conduits#show_article", as: "article_detail"

  get "/articles/:id/edit", to: "conduits#edit_article", as: "edit_article"

  match "/articles/:id", to: "conduits#update_article", via: [ :patch, :put ], as: "update_article"

  delete "/articles/:id", to: "conduits#destroy_article", as: "destroy_article"

  get "/users/sign_up", to: "registrations#new", as: "new_user_registration"

  post "/users", to: "registrations#create", as: "user_registration"

  get "/users/sign_in", to: "sessions#new", as: "new_user_session"

  post "/users/sign_in", to: "sessions#create", as: "user_session"

  delete "/users/sign_out", to: "sessions#destroy", as: "destroy_user_session"
end
