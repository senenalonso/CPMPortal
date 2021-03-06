var StackedBarChart = {
	draw: function(config) {
		me = this,
		stackKey = config.key,
		data = config.data,
		id = config.id,
		margin = {top: 10, right: 30, bottom: 30, left: 30},
		width = 600 - margin.left - margin.right,
		height = 250 - margin.top - margin.bottom,
		xScale = d3.scaleBand().range([0, width]).padding(0.2),
		yScale = d3.scaleLinear().range([height, 0]),
		color = d3.scaleOrdinal(d3.schemeCategory20),
		xAxis = d3.axisBottom(xScale),
		yAxis =  d3.axisLeft(yScale),
		
		svg = d3.select(id)
		.attr("width", width + margin.left + margin.right)
		.attr("height", height + margin.top + margin.bottom)
		.append("g")
		.attr("transform", "translate(" + margin.left + "," + margin.top + ")");



		var divTooltip = d3.select("body").append("div").attr("class", "toolTip");

		var options = d3.keys(data[0]).filter(function(key) { return key !== "label"; });	

		var stack = d3.stack()
		.keys(stackKey)
		.order(d3.stackOrderNone)
		.offset(d3.stackOffsetNone);

		var layers= stack(data);

		xScale.domain(data.map(function(d) { return d.label; }));
		yScale.domain([0, d3.max(layers[layers.length - 1], function(d) { return d[0]/3 + d[1]; }) ]).nice();

		var layer = svg.selectAll(".layer")
		.data(layers)
		.enter().append("g")
		.attr("class", "layer")
		.style("fill", function(d, i) { return color(i); });

		layer.selectAll("rect")
		.data(function(d) { return d; })
		.enter().append("rect")
		.attr("x", function(d) { return xScale(d.data.label); })
		.attr("y", function(d) { return yScale(d[1]); })
		.attr("height", function(d) { return yScale(d[0]) - yScale(d[1]); })
		.attr("width", xScale.bandwidth());
		
		svg.append("g")
		.attr("class", "axis axis--x")
		.attr("transform", "translate(0," + (height+5) + ")")
		.call(xAxis);

		svg.append("g")
		.attr("class", "axis axis--y")
		.attr("transform", "translate(0,0)")
		.call(yAxis);	

		var legend = svg.selectAll(".legend")
		.data(options.slice())
		.enter().append("g")
		.attr("class", "legend")
		.attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

		legend.append("rect")
		.attr("x", 10)
		.attr("width", 18)
		.attr("height", 18)
		.style("fill", function(d, i) { return color(i); });

		legend.append("text")
		.attr("x", 40)
		.attr("y", 9)
		.attr("dy", ".35em")
		.text(function(d) { return d; });	
	}
}