

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
	
	Advice.destroy_all
	Component.destroy_all
	Project.destroy_all
	User.destroy_all

	user = User.create!(email: "senen@nen.com",
															password: "123456",
															name: "Senén",
															role: 1,															
															)

	user.projects.create(code: "CO0001",
																 name: "Proyecto Pruebas SENEN",
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 remedy: "REQ000000000000",
																 uuaa: "NCQA",
																 date_requested: Date.parse((Date.today - (5*2).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 scope: "Distribuido",
																 category: "Prueba",
																 status: "En curso"
																 )

	10.times do |index|
		user = User.create!(email: "a#{index}@nen.com",
															password: "123456",
															name: "a#{index}a#{index}",
															role: 0,															
															)
		3.times do |index2|
			project_test = user.projects.create(code: get_code,
																 name: "Proyecto Pruebas #{index}#{index2}",
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 remedy: "REQ00000#{index}#{index2}#{index}#{index2}",
																 uuaa: "NCQA",
																 date_requested: Date.parse((Date.today - (5*index2).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 scope: "Distribuido",
																 category: "Prueba",
																 status: "En curso"
																 )

			project_opt = user.projects.create(code: get_code,
																 name: "Proyecto Optimización #{index}#{index2}",
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 remedy: "REQ00000#{index}#{index2}#{index}#{index2}",
																 uuaa: "NCQA",
																 date_requested: Date.parse((Date.today - (3*index2).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 scope: "Distribuido",
																 category: "Optimización",
																 status: "En curso"
																 )

			3.times do |index3|
				componente = project_opt.components.create(name: "Componente #{index}#{index2}#{index3}",
																						description: "Descripción del componente #{index}#{index2}#{index3}",
																						category: "JCL"
																						)
				3.times do |index4|
					advice = componente.advices.create(
																			short: "Recomendación  #{index}#{index2}#{index3}#{index4}",
																			problem: "Problema  #{index}#{index2}#{index3}#{index4}",
																			explanation: "Explicación  #{index}#{index2}#{index3}#{index4}" ,
																			before: "Código antes  #{index}#{index2}#{index3}#{index4}" ,
																			after: "Código después  #{index}#{index2}#{index3}#{index4}",
																			improvement1: "50",
																			unit1: "%",
																			metric1: "CPU"
																			)
				advice.save
				end

				componente.save
			end



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
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 remedy: "REQ0000000#{index}0#{index}",
																 uuaa: "NCQA",
																 date_requested: Date.parse((Date.today - (5*index).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 scope: "Distribuido",
																 category: "Prueba",
																 status: "Sin asignar"
																 )

		if index.odd?
			Project.create!(code: get_code,
																 name: "LIBRE Proyecto Optimización #{index}",
																 description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas 
																 y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las 
																 industrias desde el año 1500",
																 remedy: "REQ0000000#{index}#{index}",
																 uuaa: "NCQA",
																 date_requested: Date.parse((Date.today - (5*index).day).to_s).strftime("%d-%m-%Y").gsub('-', '/'),
																 scope: "Distribuido",
																 category: "Optimización",
																 status: "Sin asignar"
																 )
		end
	end
end

populate

