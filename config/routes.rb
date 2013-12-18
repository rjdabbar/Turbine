Turbine::Application.routes.draw do
  root "sessions#new"
  post "/auth/:provider/callback" => "sessions#create"
  resources :profile, only: [:show, :create]
  resources :game, only: [:show]
end
