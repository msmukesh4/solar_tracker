Rails.application.routes.draw do
  	devise_for :users, controllers: { confirmations: 'confirmations' }
  	
  	devise_scope :user do
  		root to: "devise/sessions#new"
	end
	# root to: "static#index"
	# get "/index.html" => "static#index"
	# get "/index2.html" => "static#index2"
	# get "/index3.html" => "static#index3"
	# get "/form.html" => "static#form"
	# get "/form_advanced.html" => "static#form_advanced"
	# get "/tables.html" => "static#tables"
	# get "/tables_dynamic.html" => "static#tables_dynamic"
	# get "/general_elements.html" => "static#general_elements"
	# get "/media_gallery.html" => "static#media_gallery"
	# get "/typography.html" => "static#typography"
	# get "/icons.html" => "static#icons"
	# get "/glyphicons.html" => "static#glyphicons"
	# get "/widgets.html" => "static#widgets"
	# get "/invoice.html" => "static#invoice"
	# get "/inbox.html" => "static#inbox"
	# get "/calendar.html" => "static#calendar"
	# get "/chartjs.html" => "static#chartjs"
	# get "/chartjs2.html" => "static#chartjs2"
	# get "/morisjs.html" => "static#morisjs"
	# get "/echarts.html" => "static#echarts"
	# get "/other_charts.html" => "static#other_charts"
	# get "/fixed_sidebar.html" => "static#fixed_sidebar"
	# get "/fixed_footer.html" => "static#fixed_footer"
	# get "/kitchen_sink" => "static#kitchen_sink"
	# get "/kitchen8_sink" => "static#kitchen8_sink"
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
