Rails.application.routes.draw do
	get 	'/',	to: 'site#index',	as: :home 
end
