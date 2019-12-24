#TPC Lost Dimension
USE tpc_lost

-- null record
-- INSERT INTO tpc_lost.customer_dimension 
-- VALUES(0,null,null,null,null,null,null,null,null,null,null,null,null,null);

-- populate customer dimension
INSERT INTO tpc_lost.customer_dimension (customer_sk,custID_nk,name,suite,department,address,city,stateName,state,zip,custtypeid,typename,division)
SELECT customer_sk,custID_nk,name,suite,department,address,city,stateName,state,zip,custtypeid,typename,division
FROM salesorders_02_2191.customer_dimension;

-- populate product dimension
INSERT INTO tpc_lost.product_dimension (product_sk,prodId_nk,division,prodDesc,price1,price2,unitCost,prodTypeID,typeDesc,buID,buName,buAbbrev)
SELECT product_sk,prodId_nk,division,prodDesc,price1,price2,unitCost,prodTypeID,typeDesc,buID,buName,buAbbrev
FROM salesorders_02_2191.product_dimension;

-- populate fact table
INSERT INTO tpc_lost.tpc_sales_lost_fact(customer_sk,product_sk,amt,qty,shipCost)
SELECT customer_sk,product_sk,SUM(amt),SUM(qty),SUM(shipCost)
FROM salesorders_02_2191.tpc_sales_fact
GROUP BY customer_sk,product_sk; 