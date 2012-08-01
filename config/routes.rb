LightningTalks::Application.routes.draw do
  resources :goals, :only => [] do
    resources :tasks, :only => [:index] do
      member do
        put :start
        put :complete
      end
    end
  end
end
