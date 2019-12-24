USE tpc_lost;

# Query 1
# Max amount spent by each customer, and the corresponding productType

SELECT c.name 'Customer', p.typeDesc 'Product Type', MAX(f.amt) 'Max amount'
FROM tpc_sales_lost_fact f 
JOIN customer_dimension c USING (customer_sk)
JOIN product_dimension p USING (product_sk)
GROUP BY c.name;

# Query 2
# Business Units which sold more than 150000 products by state

SELECT p.buName 'Business Unit', c.stateName 'State', SUM(f.qty) 'Quantity Sold'
FROM tpc_sales_lost_fact f 
JOIN customer_dimension c USING (customer_sk)
JOIN product_dimension p USING (product_sk)
GROUP BY p.buName, c.stateName
HAVING `Quantity Sold` > 150000
ORDER BY p.buName ASC, c.stateName ASC;


