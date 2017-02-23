Rails.application.routes.draw do

  devise_for :users
  
	root to: "site#index"
	
	get 	'/',					to: 'site#index',	as: :home 
	
end
