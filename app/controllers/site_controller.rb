class SiteController < ApplicationController
	def home
		@info_projects = Project.get_project_info_by_user(current_user)
		@info_projects_global = Project.get_project_info_global()

		render 'site/home'
	end
end
