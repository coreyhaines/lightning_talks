LightningTalks::Application.routes.draw do
  resources :talks, only: [:index]
end
