Rails.application.routes.draw do

  resources :advices
  resources :components
  devise_for :users
  resources :projects
  
	root to: "site#home"
	
	get 	'/',					to: 'site#home',	as: :home 

	get 	'/projects/:id/assign',					to: 'projects#assign',	as: :assign_project 
	get 	'/projects/:id/close',					to: 'projects#close',	as: :close_project 
	
end
