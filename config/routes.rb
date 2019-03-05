Rails.application.routes.draw do
	devise_for :users
	root 'profile#home'
  	
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :profile 
  	resources :products do
  		resources :reviews do
  			resources :comments
  		end
  	end
end
