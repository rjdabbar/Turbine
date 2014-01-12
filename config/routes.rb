Turbine::Application.routes.draw do
  root "sessions#new"
  post "/auth/:provider/callback" => "sessions#create"
  resources :profile, only: [:show, :create]
  get  "game/make_chart", as: :chart
  resources :game, only: [:show, :index]
  put "game/stash"
  resources :stats
  resources :stasheds
  post "game/pick_chart"

end
