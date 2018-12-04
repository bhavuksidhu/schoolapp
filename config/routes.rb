Rails.application.routes.draw do
  root to: 'home#index' 
  devise_for :users

  namespace :superadmin do
    resources :superadminbase, :dashboard
  end
end
