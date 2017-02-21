Rails.application.routes.draw do
  devise_for :users, 	path: '',
  										path_names: {sign_in: 'login', sign_up: 'signup'},
  										controllers: {sessions: 'users/sessions'}

  get 	'/users/:id', to: 'users#show'
	get 	'/',					to: 'site#index',	as: :home 
end
