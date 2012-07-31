LightningTalks::Application.routes.draw do
    resources :books, :only => [:index] do
        resources :votes, :only => [:create]
    end
end
