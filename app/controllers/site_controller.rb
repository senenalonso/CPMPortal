class SiteController < ApplicationController
	def home
		@info_proyectos = Project.get_project_info_by_user(current_user)
		binding.pry
		render 'site/home'
	end
end
