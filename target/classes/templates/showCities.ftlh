<!DOCTYPE html>
<html>
    <head>
        <title>Sales</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
		<style>
			.currSign:before { 
				content: '$'; 
			}
			table{
					background-color: #f2f2f2;
			}
			td{
				text-align: right;
				width:10%;
			}
			tr{
				border-bottom: 1px solid; 
				border-top: 1px solid; 
			}
			th {
				min-width:10%;
				color: black;
				border-left: 1px solid white;
				border-right: 1px solid white;
				text-align: left;
			}
		</style>
    </head>
    <body>
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

            <#list cities as city>
                <tr>
                    <td>${city.name}</td>
					<td class="dollars">${city.costperitem}</td>
					<td class="dollars">${city.percentmarkup}</td>
					<td>${city.totalsold}</td>
					<td class="dollars">${city.totalrevenue}</td>
					<td class="dollars">${city.shipcharge}</td>
					<td class="dollars">${city.shipcost}</td>
					<td class="dollars">${city.profitperitem}</td>
					<td>${city.returns}</td>
					<td class="dollars">${city.totalincome}</td>
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