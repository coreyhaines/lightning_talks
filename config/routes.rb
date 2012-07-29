LightningTalks::Application.routes.draw do
  resources :talks, only: [:index] do
    collection do
      get :sorted
    end
    resources :votes, only: [:create]
  end
end
