Rails.application.routes.draw do

  devise_for :users
  
	root 																	to: "site#home"	
	get 	'/',														to: 'site#home',	as: :home 
	get 	'/projects/:id/assign',					to: 'projects#assign',	as: :assign_project 
	get 	'/projects/:id/close',					to: 'projects#close',	as: :close_project 
	get 	'/projects/search',							to: 'projects#search',	as: :search_project 
	post 	'/projects/search',							to: 'projects#search'
	get 	'/projects/:id/report',					to: 'projects#report',	as: :report_project 
	get 	'/components/search',						to: 'components#search',	as: :search_component 
	post 	'/components/search',						to: 'components#search'

  resources :projects
  resources :advices
  resources :components
	
end
