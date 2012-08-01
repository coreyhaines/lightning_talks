LightningTalks::Application.routes.draw do
  resources :tasks, :only => [:index, :create, :new] do
    get :completed
    get :started
  end
end
