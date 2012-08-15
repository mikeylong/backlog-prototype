CommonBacklog::Application.routes.draw do
  
  match '/programs/prioritize' => 'programs#prioritize'

  resources :plans

  resources :projects
  resources :programs do
    resources :objectives
  end

  root :to => 'programs#index'

end
