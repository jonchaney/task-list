Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json } do
    resources :tasks, only: [:create, :update, :show, :index]
    resources :groups, only: [:create, :update, :show, :index]
  end

  root "static_pages#root"
end
