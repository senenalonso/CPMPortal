class SiteController < ApplicationController
	def home
		@info_projects = Project.get_project_info_by_user(current_user)

		render 'site/home'
	end
end
