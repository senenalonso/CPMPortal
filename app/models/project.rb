class Project < ApplicationRecord
	has_and_belongs_to_many :users
	has_many :components

	before_save :set_code

	validates :name, :presence => true
	validates :date_requested, :presence => true
	validates :scope, :presence => true
	validates :category, :presence => true

	def self.get_project_info_by_user(user)

		user_projects	= user.projects

		old = user_projects.where(status: "Cerrado")
		tests = user_projects.all.select {|p| !p.status.include?("Cerrado") && p.category.include?("Prueba")}
		opts = user_projects.all.select {|p| !p.status.include?("Cerrado") && p.category.include?("Optimización")}

		projects_info = Hash["test_count" => tests.count, 
												"opt_count" => opts.count, 
												"unassigned_count" => unassigned.count, 
												"old_count" => old.count, 
												"tests" => tests, 
												"opts" => opts, 
												"old" => old, 
												"unassigned" => unassigned
											]

		projects_info
	end

	def self.get_workload(users)

		workload = users.map do |u|  
			user_projects	= u.projects

			tests = user_projects.all.select {|p| !p.status.include?("Cerrado") && p.category.include?("Prueba")}
			opts = user_projects.all.select {|p| !p.status.include?("Cerrado") && p.category.include?("Optimización")}

			user_data = {"label": u.name,"Optimizaciones": opts.count,"Pruebas": tests.count}

			user_data

		end

		workload
	end



	def self.get_project_info_global()

		counters_assigned = Project.where(status:"En curso").group([:category]).count

		counters_unassigned = unassigned.group([:category]).count

		projects_info_global = [{label: "Pruebas en curso", value: counters_assigned["Prueba"]},
    											{label: "Optimizaciones en curso", value: counters_assigned["Optimización"]},
    											{label: "Pruebas sin asignar", value: counters_unassigned["Prueba"]},
    											{label: "Optimizaciones sin asignar", value: counters_unassigned["Optimización"]}]
															
		projects_info_global
	end

	def self.get_projects_by_filter(filter)
		Project.where(filter)		
	end

	private 

	def self.unassigned
		Project.where(status:"Sin asignar")
	end

	def set_code()
		last_id = Project.last.id+1
    new_id = sprintf '%04d', last_id
    @project.code = "CO"+new_id
	end

end
