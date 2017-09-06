Rails.application.routes.draw do
  	devise_for :users, controllers: { confirmations: 'confirmations' }
  	
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

	resources :devices do
		post 'update_user_device', on: :collection
	end

	resources :users do
		get 'assign_device', on: :collection
	end

end
