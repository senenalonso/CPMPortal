class Project < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :components
	validates :name, :presence => true
	validates :date_requested, :presence => true
	validates :scope, :presence => true
	validates :category, :presence => true

	def self.get_project_info_by_user(user)

		user_projects	= user.projects

		conters = user_projects.group([:status, :category]).count

		old, test, opt = 0, 0 ,0

		tests,opts = [], []

		conters.keys.each do |k| 
			if k.include? "Cerrado"
				old += conters[k]
			elsif k.include? "Prueba"
				test += conters[k]
			else k.include? "Optimización"
				opt += conters[k]
			end
		end

		tests = user_projects.all.select {|p| !p.status.include? "Cerrado" }.select {|p| p.category.include? "Prueba"}
		opts = user_projects.all.select {|p| !p.status.include? "Cerrado" }.select {|p| p.category.include? "Optimización"}

=begin
		old = conters.keys.select {|k| k.include? "Cerrado" }.map { |k| conters[k] }.sum

		test = conters.keys.select {|k| !k.include? "Cerrado" }.select {|k| k.include? "Prueba"}.map { |k| conters[k] }.sum

		opt = conters.keys.select {|k| !k.include? "Cerrado" }.select {|k| k.include? "Optimización" }.map { |k| conters[k] }.sum
=end
		free = Project.where(status:"Sin asignar")

		projects_info = Hash["test_count" => test, "opt_count" => opt, "free_count" => free.count, "old_count" => old, "tests" => tests, "opts" => opts, "free" => free]

		projects_info
	end

end
