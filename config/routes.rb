Rails.application.routes.draw do
  root to: 'home#index' 
  devise_for :users, :skip => [:registrations]
 
  namespace :superadmin do
    resources :dashboard
  end

  namespace :admin do
    resources :dashboard
  end
  resources :students
end