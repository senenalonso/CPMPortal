class Project < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :components
	validates :name, :presence => true
	validates :date_requested, :presence => true
	validates :scope, :presence => true
	validates :category, :presence => true

	def self.get_projects_info_by_user(user)

		user_projects	= user.projects

		counters = user_projects.group([:status, :category]).count

		old, test, opt = 0, 0 ,0

		tests,opts = [], []

		counters.keys.each do |k| 
			if k.include? "Cerrado"
				old += counters[k]
			elsif k.include? "Prueba"
				test += counters[k]
			else k.include? "Optimización"
				opt += counters[k]
			end
		end

		tests = user_projects.all.select {|p| !p.status.include? "Cerrado" }.select {|p| p.category.include? "Prueba"}
		opts = user_projects.all.select {|p| !p.status.include? "Cerrado" }.select {|p| p.category.include? "Optimización"}

		projects_info = Hash["test_count" => test, 
												"opt_count" => opt, 
												"unassigned_count" => unassigned.count, 
												"old_count" => old, 
												"tests" => tests, 
												"opts" => opts, 
												"unassigned" => unassigned
											]

		projects_info
	end

		def self.get_project_info_by_user(user)

		user_projects	= user.projects

		old = user_projects.where(status: "Cerrado").count
		tests = user_projects.all.select {|p| !p.status.include?("Cerrado") && p.category.include?("Prueba")}
		opts = user_projects.all.select {|p| !p.status.include?("Cerrado") && p.category.include?("Optimización")}

		projects_info = Hash["test_count" => tests.count, 
												"opt_count" => opts.count, 
												"unassigned_count" => unassigned.count, 
												"old_count" => old, 
												"tests" => tests, 
												"opts" => opts, 
												"unassigned" => unassigned
											]

		projects_info
	end



	def self.get_project_info_global()

		counters_assigned = Project.where(status:"En curso").group([:category]).count

		counters_unassigned = unassigned.group([:category]).count

		projects_info_global = Hash["test_count" => counters_assigned["Prueba"], 
																"opt_count" => counters_assigned["Optimización"], 
																"unassigned_test_count" => counters_unassigned["Prueba"], 
																"unassigned_opt_count" => counters_unassigned["Optimización"]
															]
															
		projects_info_global
	end

	def self.get_projects_by_filter(filter)
		Project.where(filter)		
	end

	private 

	def self.unassigned
		Project.where(status:"Sin asignar")
	end

end
