LightningTalks::Application.routes.draw do
  resources :talks, only: [:index, :new] do
    collection do
      get :sorted
    end
    resources :votes, only: [:create]
  end
end
