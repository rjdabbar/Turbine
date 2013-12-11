Turbine::Application.routes.draw do
  root "sessions#new"
  post "/auth/:provider/callback" => "sessions#create"
end
