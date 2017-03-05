Rails.application.routes.draw do

  resources :advices
  resources :components
  devise_for :users
  resources :projects
  
	root to: "site#home"
	
	get 	'/',					to: 'site#home',	as: :home 
	
end
