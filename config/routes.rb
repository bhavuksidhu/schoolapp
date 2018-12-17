Rails.application.routes.draw do

  root to: 'home#index' 
  devise_for :users, :skip => [:registrations]
 
  resources :superadmin, only: [] do
    collection do
      get :dashboard
    end
  end

  resources :admin do
  	collection do
  		get :dashboard
  	end
  end
  
  resources :students
end