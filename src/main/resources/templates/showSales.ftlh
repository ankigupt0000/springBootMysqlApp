<!DOCTYPE html>
<html>
    <head>
        <title>Online Sales Tracker</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
		<script>
		var selecteElems = [];
		var barchart = null;
		var piechart = null;
		function getSelectedElement(){
			studentsElem = document.getElementById("sales");
			tableArr = [];
			trs = studentsElem.getElementsByTagName("tr");
			for (var i = 0; i < trs.length; i++) {
				arrRow = []
				tds = trs[i].getElementsByTagName("td");
				if(trs[i].className == "selected"){
					for(var j = 0; j < tds.length; j++) {
						arrRow.push(tds[j].innerText);
					}
					tableArr.push(arrRow);
				}
			}
			return tableArr;
		}
		function drawBarChart(){
			if(barchart)
				barchart.destroy();
			document.getElementById('myBarChart').innerHTML="";
			var ctx = document.getElementById('myBarChart').getContext('2d');
			var sale_name = [];
			var profit_per_item = [];
			
			for( var i = 0; i < selecteElems.length; i++)
			{
				sale_name.push(selecteElems[i][0]);
				profit_per_item.push(selecteElems[i][7]);
			}
				
			var myChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: sale_name,
					datasets: [{
						label: "",
						data: profit_per_item,
						backgroundColor: [
							'rgba(107, 9, 13)',
							'rgba(16, 2, 43)',
							'rgba(6, 120, 72)',
							'rgba(130, 102, 3)',
							'rgba(11, 73, 92)'
						]
					}]
				},
				options: {
					title: {
						display: true,
						text: 'Product Profit Per Item'
					},
					label: {
						display: false
					},
					scales: {
						yAxes: [{
							ticks: {
								callback: function(value, index, values) {
									return '$' + value + '.00';
								},
								beginAtZero: true
							}
						}]
					},
					showTooltips: false
				}
			});
			return myChart;
		}
		function drawPiChart()
		{
			if(piechart)
				piechart.destroy();
			var ctx = document.getElementById('myPiChart').getContext('2d');
			var sale_name = [];
			var total_income = [];
			
			for( var i = 0; i < selecteElems.length; i++)
			{
				sale_name.push(selecteElems[i][0]);
				total_income.push(selecteElems[i][9]);
			}
			
			var myChart = new Chart(ctx, {
				type: 'pie',
				data: {
					labels: sale_name,
					datasets: [{
						label: '# of Votes',
						data: total_income,
						backgroundColor: [
							'rgba(107, 9, 13)',
							'rgba(16, 2, 43)',
							'rgba(6, 120, 72)',
							'rgba(130, 102, 3)',
							'rgba(11, 73, 92)'
						]
					}]
				},
				options: {
					title: {
						display: true,
						text: '% Income Per Product'
					},
					showTooltips: false
				}
			});
			return myChart;
		}
		</script>
		<script>
			var lastSelectedRow;
			var trs = document.getElementsByTagName('tr');

			// disable text selection
			document.onselectstart = function() {
				return false;
			}

			function RowClick(currenttr, lock) {
				if (window.event.ctrlKey) {
					toggleRow(currenttr);
				}

				if (window.event.button === 0) {
					if (!window.event.ctrlKey && !window.event.shiftKey) {
						clearAll();
						toggleRow(currenttr);
					}

					if (window.event.shiftKey) {
						selectRowsBetweenIndexes([lastSelectedRow.rowIndex+1, currenttr.rowIndex+1])
					}
				}
				selecteElems=getSelectedElement();
				barchart=drawBarChart();
				piechart=drawPiChart();
			}

			function toggleRow(row) {
				row.className = row.className == 'selected' ? '' : 'selected';
				lastSelectedRow = row;
			}

			function selectRowsBetweenIndexes(indexes) {
				indexes.sort(function(a, b) {
					return a - b;
				});

				for (var i = indexes[0]; i <= indexes[1]; i++) {
					trs[i-1].className = 'selected';
				}
			}

			function clearAll() {
				for (var i = 0; i < trs.length; i++) {
					trs[i].className = '';
				}
			}
		</script>
		<style>
			.selected {
				background: lightBlue
			}
			.currSign:before { 
				content: '$'; 
			}
			table#sales{
					background-color: #f2f2f2;
			}
			table#sales td{
				text-align: right;
				width:10%;
			}
			table#sales tr{
				border-bottom: 1px solid; 
				border-top: 1px solid; 
			}
			table#sales th {
				min-width:10%;
				color: black;
				border-left: 1px solid white;
				border-right: 1px solid white;
				text-align: left;
			}
		</style>
    </head>
    <body>
		<h1 style="color:gray">Online Sales Tracker</h1>
	    <!-- Bar Chart Start -->
		<table id = "charts">
		<tr>
		<td>
		<div class="chart-container" style="height:50vh; width:40vw">
		<canvas id="myBarChart"></canvas>
		</div>
		</td>
		<td>
		<div class="chart-container" style="height:50vh; width:40vw">
		<canvas id="myPiChart"></canvas>
		</div>
		</td>
		</tr>
		</table>
        <table id="sales">
            <tr>
                <th>Name</th>
				<th>Cost per Item </th>
				<th>Percent Markup </th>
				<th>Total Sold</th>
				<th>Total Revenue</th>
				<th>Shipping Charge/Item</th>
				<th>Shipping Cost/Item</th>
				<th>Profit per Item (incl. shipping)</th>
				<th>Returns</th>
				<th>Total Income<th>
            </tr>

            <#list sales as sale>
                <tr onmousedown="RowClick(this,false);" class="selected">
                    <td>${sale.name}</td>
					<td class="dollars">${sale.costperitem}</td>
					<td class="dollars">${sale.percentmarkup}</td>
					<td>${sale.totalsold}</td>
					<td class="dollars">${sale.totalrevenue}</td>
					<td class="dollars">${sale.shipcharge}</td>
					<td class="dollars">${sale.shipcost}</td>
					<td class="dollars">${sale.profitperitem}</td>
					<td>${sale.returns}</td>
					<td class="dollars">${sale.totalincome}</td>
                </tr>
            </#list>
        </table>
		<script> 
			let x = document.querySelectorAll(".dollars"); 
			for (let i = 0, len = x.length; i < len; i++) { 
				let num = Number(x[i].innerHTML) 
						  .toLocaleString('en-IN',{minimumFractionDigits: 2, maximumFractionDigits: 2}); 
				x[i].innerHTML = num; 
				x[i].classList.add("currSign"); 
			} 
		</script> 
		<script>
		selecteElems=getSelectedElement();
		barchart=drawBarChart();
		piechart=drawPiChart();
		</script>
    </body>
</html>