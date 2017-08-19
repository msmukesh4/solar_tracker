Rails.application.routes.draw do
  	devise_for :users
  	
  	devise_scope :user do
  		root to: "devise/sessions#new"
	end
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	
  	#--- Only for API calls---
	namespace :api, defaults: {format: 'json'} do
		namespace :v1 do
			resources :devices do
				get 'save_data' , :on => :collection
			end
		end
	end

	resources :devices

	resources :users

end
