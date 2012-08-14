CommonBacklog::Application.routes.draw do
  
  match '/programs/prioritize' => 'programs#prioritize'
  resources :objectives

  resources :plans

  resources :backlogs, :projects, :programs

  root :to => 'programs#index'

end
