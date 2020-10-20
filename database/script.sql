DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(100),
    costperitem NUMERIC(10,2),
	percentmarkup NUMERIC(10,2),
	totalsold NUMERIC(10,2),
	totalrevenue NUMERIC(10,2),
	shipcharge NUMERIC(10,2),
	shipcost NUMERIC(10,2),
	profitperitem NUMERIC(10,2),
	returns NUMERIC(10,2),
	totalincome NUMERIC(10,2)
	);

INSERT INTO sales(name, costperitem,percentmarkup,totalsold,totalrevenue,shipcharge,shipcost,profitperitem,returns,totalincome) 
	VALUES('Item 1', 10.00, 1.00, 15, 300.00, 10.00, 5.75, 14.25, 2, 196.75);
INSERT INTO sales(name, costperitem,percentmarkup,totalsold,totalrevenue,shipcharge,shipcost,profitperitem,returns,totalincome) 
	VALUES('Item 2', 11.50, 0.75, 18, 362.25, 10.00, 5.75, 12.88, 1, 224.63);
INSERT INTO sales(name, costperitem,percentmarkup,totalsold,totalrevenue,shipcharge,shipcost,profitperitem,returns,totalincome) 
	VALUES('Item 3', 13.00, 0.65, 20, 429.00, 10.00, 6.25, 12.20, 0, 244.00);
INSERT INTO sales(name, costperitem,percentmarkup,totalsold,totalrevenue,shipcharge,shipcost,profitperitem,returns,totalincome) 
	VALUES('Item 4',  5.00, 0.90, 50, 475.00,  5.00, 3.50,  6.00, 0, 300.00);
INSERT INTO sales(name, costperitem,percentmarkup,totalsold,totalrevenue,shipcharge,shipcost,profitperitem,returns,totalincome) 
	VALUES('Item 5',  4.00, 0.90, 42, 319.20,  5.00, 3.25,  5.35, 3, 218.40);
