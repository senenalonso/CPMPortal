function initGraphWorkload() {
  $.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'graphs/workload',
           dataType: 'json',
           success: function (data) {
               draw_workload(data);               
           },
           error: function (result) {
            console.log(result);
               error();
           }
       });
}

function draw_workload(data) {
		var key = ["Optimizaciones", "Pruebas"];
		
		StackedBarChart.draw({
			data: data,
			key: key,
			element: 'stacked-bar',
			id: '#workload'
		});

}


function initGraphRequests() {
  $.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'graphs/requests',
           dataType: 'json',
           success: function (data) {
               draw_requests(data);               
           },
           error: function (result) {
            console.log(result);
               error();
           }
       });
}

function draw_requests(data) {
		var key = ["abiertas", "cerradas", "rechazadas"];
		
		StackedBarChart.draw({
			data: data,
			key: key,
			element: 'stacked-bar',
			id: '#requests'
		});

}


function initGraphTests() {
  $.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'graphs/tests',
           dataType: 'json',
           success: function (data) {
               draw_tests(data);               
           },
           error: function (result) {
            console.log(result);
               error();
           }
       });
}

function draw_tests(data) {
		var key = ["aceptado", "aceptado con riesgo", "rechazado", "no aplica"];
		
		StackedBarChart.draw({
			data: data,
			key: key,
			element: 'stacked-bar',
			id: '#tests'
		});

}


function initGraphGlobal() {
  $.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'graphs/global',
           dataType: 'json',
           success: function (data) {
               draw_global(data);               
           },
           error: function (result) {
            console.log(result);
               error();
           }
       });
}

function draw_global (data) {
    Morris.Donut({
        element: 'global',
        data: data,
        resize: true
    });
}


function initGraphs() {
	initGraphWorkload();
	initGraphRequests(); 
	initGraphTests(); 
	initGraphGlobal();
}

$(document).ready(initGraphs);