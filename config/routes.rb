LightningTalks::Application.routes.draw do
  resources :goals, :only => [] do
    resources :tasks, :only => [:index] do
    end
  end
end
