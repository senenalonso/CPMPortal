

def self.get_code
	if Project.last
		last_id = Project.last.id+1
	else
		last_id = 1
	end
  new_id = sprintf '%04d', last_id
  code = "CO"+new_id
  code
end

def populate
	10.times do |index|
		user = User.create!(email: "a#{index}@nen.com",
															password: "123456",															
															)
		3.times do |index2|
			project_test = user.projects.create(code: get_code,
																 name: "Proyecto Pruebas #{index}#{index2}",
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 date_requested: Date.parse((Date.today - (5*index2).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 scope: "Distribuido",
																 category: "Prueba",
																 status: "En curso"
																 )

			project_opt = user.projects.create(code: get_code,
																 name: "Proyecto Optimización #{index}#{index2}",
																 date_requested: Date.parse((Date.today - (3*index2).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 scope: "Distribuido",
																 category: "Optimización",
																 status: "En curso"
																 )

			if index2.odd?
				project_test.status = "Cerrado"
				project_opt.status = "Cerrado"
				project_test.save
				project_opt.save
			end
		end
	end


	10.times do |index|
		Project.create!(code: get_code,
																 name: "LIBRE Proyecto Pruebas #{index}",
																 date_requested: Date.parse((Date.today - (5*index).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 scope: "Distribuido",
																 category: "Prueba",
																 status: "Sin asignar"
																 )

		if index.odd?
			Project.create!(code: get_code,
																 name: "LIBRE Proyecto Optimización #{index}",
																 date_requested: Date.parse((Date.today - (5*index).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 scope: "Distribuido",
																 category: "Prueba",
																 status: "Sin asignar"
																 )
		end
	end
end

populate

