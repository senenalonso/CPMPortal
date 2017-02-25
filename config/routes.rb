Rails.application.routes.draw do

  devise_for :users
  resources :projects
  
	root to: "site#home"
	
	get 	'/',					to: 'site#home',	as: :home 
	
end
