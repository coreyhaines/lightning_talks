LightningTalks::Application.routes.draw do
  resources :talks, only: [:index, :new, :create] do
    collection do
      get :sorted
    end
    resources :votes, only: [:create]
  end
end
