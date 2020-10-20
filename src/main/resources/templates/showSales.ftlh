<!DOCTYPE html>
<html>
    <head>
        <title>Online Sales Tracker</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
		<style>
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
		<table>
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
		<script>
		var ctx = document.getElementById('myBarChart').getContext('2d');
		var sale_name = [
		<#list sales as sale>
			'${sale.name}',
		</#list>
		"" ];
		sale_name.pop();
		
		var profit_per_item = [
		<#list sales as sale>
			${sale.profitperitem},
		</#list>
		""];
		profit_per_item.pop();
		
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
							}
						}
					}]
				}
			}
		});
		</script>
		<!-- Bar Chart End -->
		<!-- Pie Chart Start -->
		<script>
		var ctx = document.getElementById('myPiChart').getContext('2d');
		var total_income = [
		<#list sales as sale>
			${sale.totalincome},
		</#list>
		""];
		total_income.pop();
		
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
				}
			}
		});
		</script>
		<!-- Pie Chart End -->
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
                <tr>
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
    </body>
</html>