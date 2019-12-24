use tpc_shrunken;

# Query 1
# Average ship cost per quarter per year

SELECT s.sales_year 'Year', s.sales_quarter 'Quarter', 
	AVG(f.QuarterlyshipCost) 'Average Quarterly Shipping Cost Per Year'
FROM tpc_sales_shrunken_fact f 
JOIN sales_quarterly_dimension s USING(sales_quarter_sk)
GROUP BY s.sales_year, s.sales_quarter;

# Query 2
# Quarterly amount for all years together

SELECT s.sales_quarter 'Quarter', SUM(f.Quarterlyamt) 'Total Amount'
FROM tpc_sales_shrunken_fact f 
JOIN sales_quarterly_dimension s USING(sales_quarter_sk)
GROUP BY s.sales_quarter;
