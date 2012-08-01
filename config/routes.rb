LightningTalks::Application.routes.draw do
  resources :tasks, :only => [:index, :create, :new, :edit, :update, :destroy] do
    get :completed
    get :started
  end
end
