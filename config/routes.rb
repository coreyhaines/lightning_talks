LightningTalks::Application.routes.draw do
  resources :talks, only: [:index] do
    resources :votes, only: [:create]
  end
end
