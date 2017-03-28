Rails.application.routes.draw do

  devise_for :users
  
	root 																	to: "site#home"	
	get 	'/',														to: 'site#home',	as: :home 

	get 	'/statistics',									to: 'statistics#index',	as: :statistics


	get 	'/projects/:id/report',					to: 'projects#report',	as: :report_project 	
	get 	'/projects/:id/assign',					to: 'projects#assign',	as: :assign_project 
	get 	'/projects/:id/close',					to: 'projects#close',	as: :close_project 
	get 	'/projects/search',							to: 'projects#search',	as: :search_project 
	post 	'/projects/search',							to: 'projects#search'

	get 	'/components/search',						to: 'components#search',	as: :search_component 
	post 	'/components/search',						to: 'components#search'


  get 'graphs/index'
  get 'graphs/data', defaults: { :format => 'json' }
  get 'graphs/workload', defaults: { :format => 'json' }
  get 'graphs/requests', defaults: { :format => 'json' }
  get 'graphs/tests', defaults: { :format => 'json' }
  get 'graphs/global', defaults: { :format => 'json' }

  resources :projects
  resources :advices
  resources :components
	
end
