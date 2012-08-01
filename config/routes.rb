LightningTalks::Application.routes.draw do
    resources :themes, :only => [:index] do
      resources :books, :only => [:index, :new, :create] do
        collection do
          get :sorted
        end
        resources :votes, :only => [:create]
      end
    end
end
