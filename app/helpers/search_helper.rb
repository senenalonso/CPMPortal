module SearchHelper
	def build_filter(params)
	  params.delete_if{|k, v| k == "controller" || k == "action" || v == ""}
	  filter = params.map{|k, v| "#{k} = '#{v}'"}.join(" AND ")
	  filter
	end
end  