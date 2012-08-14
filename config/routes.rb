CommonBacklog::Application.routes.draw do
  resources :objectives

  resources :plans

  resources :backlogs, :projects, :programs

  root :to => 'programs#index'

end
