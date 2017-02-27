class Project < ApplicationRecord
	has_and_belongs_to_many :users
	validates :name, :presence => true
	validates :date_requested, :presence => true
	validates :scope, :presence => true
	validates :action, :presence => true

	def self.get_project_info_by_user(user)

		user_projects = user.projects.group([:status, :action]).count

		old = user_projects.keys.select {|k| k.include? "Cerrado" }.map { |k| user_projects[k] }.sum

		test = user_projects.keys.select {|k| !k.include? "Cerrado" }.select {|k| k.include? "Prueba"}.map { |k| user_projects[k] }.sum

		opt = user_projects.keys.select {|k| !k.include? "Cerrado" }.select {|k| k.include? "Optimización" }.map { |k| user_projects[k] }.sum

		free = Project.where(status:"Sin asignar").count

		projects_info = Hash["test" => test, "opt" => opt, "free" => free, "old" => old]

		projects_info
	end

end
