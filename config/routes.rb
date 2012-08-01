LightningTalks::Application.routes.draw do
  resources :goals, :only => [:index] do
    collection do
        get :completed, :uncompleted
    end
    resources :tasks, :only => [:index, :new, :create] do
       collection do
         get :completed, :uncompleted
       end
    end
  end
end
