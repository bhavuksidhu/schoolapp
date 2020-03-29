Rails.application.routes.draw do

  root to: 'home#index' 
  devise_for :users, :skip => [:registrations]
 
  resources :super_admin, only: [] do
    collection do
      get :dashboard
    end
  end

  resources :admins do
  	collection do
  		get :dashboard
  	end
  end
  
  resources :students

  resource :users, only: [:edit, :update]  
end