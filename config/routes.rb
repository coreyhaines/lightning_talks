LightningTalks::Application.routes.draw do
  resources :goals, :only => [] do
    resources :tasks, :only => [:index, :create, :new, :edit, :update, :destroy] do
      get :completed
      get :started
    end
  end

  resources :projects, :only => [:index, :create, :new, :edit, :update, :destroy] do
    resources :goals, :only => [:index, :create, :new, :edit, :update, :destroy]
  end
end
