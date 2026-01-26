/*
	====================================================================
    Description:
		TOTAL ROWS IN FILE 60399:
        TOTAL ROWS ADDED 60398:
        all looks to be correct.
    
	====================================================================
	Script purpose:
		Loads all the data from the csv file into the crm_sales_details table. If no value is found then we are adding the null value to represent it.
*/

USE dw_bronze;

TRUNCATE TABLE crm_sales_details;

LOAD DATA LOCAL INFILE '/home/tay/dataWareHouse/sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
INTO TABLE crm_sales_details
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@sls_ord_num, @sls_prd_key, @sls_cust_id, @sls_order_dt, @sls_ship_dt, @sls_due_dt, @sls_sales, @sls_quantity, @sls_price)
SET 
	sls_ord_num = NULLIF(@sls_ord_num, ''),
    sls_prd_key = NULLIF(@sls_prd_key, ''),
    sls_cust_id = NULLIF(@sls_cust_id, ''),
    sls_order_dt = NULLIF(@sls_order_dt, ''),
    sls_ship_dt = NULLIF(@sls_ship_dt, ''),
    sls_due_dt = NULLIF(@sls_due_dt, ''),
    sls_sales = NULLIF(@sls_sales, ''),
    sls_quantity = NULLIF(@sls_quantity, ''),
    sls_price = NULLIF(@sls_price, '');
    
SELECT * FROM crm_sales_details;
SELECT COUNT(*) FROM crm_sales_details;

