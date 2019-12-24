-- populating shrunken 
USE tpc_shrunken;

-- populating customer dimension
INSERT INTO tpc_shrunken.customer_dimension(customer_sk,custID_nk,name,suite,department,address,city,stateName,state,zip,custtypeid,typename,division)
SELECT customer_sk,custID_nk,name,suite,department,address,city,stateName,state,zip,custtypeid,typename,division
FROM salesorders_02_2191.customer_dimension;

-- populating product dimension
INSERT INTO tpc_shrunken.product_dimension(product_sk,prodId_nk,division,prodDesc,price1,price2,unitCost,prodTypeID,typeDesc,buID,buName,buAbbrev)
SELECT product_sk,prodId_nk,division,prodDesc,price1,price2,unitCost,prodTypeID,typeDesc,buID,buName,buAbbrev
FROM salesorders_02_2191.product_dimension;

-- populating sales month dimension
INSERT INTO tpc_shrunken.sales_quarterly_dimension(sales_year,sales_quarter,sales_fiscal_year,sales_fiscal_quarter)
SELECT sales_year,sales_quarter,sales_fiscal_year,sales_fiscal_quarter
FROM salesorders_02_2191.sales_date_dimension 
GROUP BY sales_year,sales_quarter,sales_fiscal_year,sales_fiscal_quarter;

-- populating fact table
/*INSERT tpc_shrunken.tpc_sales_shrunken_fact(customer_sk,product_sk,sales_quarter_sk,quarterlyamt,quarterlyqty,quarterlyshipcost)
SELECT cn.customer_sk,pn.product_sk,sn.sales_quarter_sk,sum(tsf.amt),sum(tsf.qty),sum(tsf.shipcost)
FROM salesorders_02_2191.tpc_sales_fact tsf 
	JOIN tpc_shrunken.customer_dimension cn using (customer_sk)
	JOIN tpc_shrunken.product_dimension pn using (product_sk)
	JOIN salesorders_02_2191.sales_date_dimension so using (salesDate_sk)
	JOIN tpc_shrunken.sales_quarterly_dimension sn using(sales_year,sales_quarter,sales_fiscal_year,sales_fiscal_quarter)
GROUP BY customer_sk,product_sk,sales_quarter_sk;	
*/
