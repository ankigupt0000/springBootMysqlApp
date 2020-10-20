<!DOCTYPE html>
<html>
    <head>
        <title>Cities</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        </head>
    <body>
         <table>
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
					<td>${city.costperitem}</td>
					<td>${city.percentmarkup}</td>
					<td>${city.totalsold}</td>
					<td>${city.totalrevenue}</td>
					<td>${city.shipcharge}</td>
					<td>${city.shipcost}</td>
					<td>${city.profitperitem}</td>
					<td>${city.returns}</td>
					<td>${city.totalincome}</td>
                </tr>
            </#list>
        </table>
    </body>
</html>