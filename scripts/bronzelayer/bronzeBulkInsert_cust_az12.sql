/*
	====================================================================
    Description:
		TOTAL ROWS IN FILE 18485:
        TOTAL ROWS ADDED 18484:
        all looks to be correct.
    
	====================================================================
	Script purpose:
		Loads all the data from the csv file into the erp_cust_az12 table. If no value is found then we are adding the null value to represent it.
*/

USE dw_bronze;

TRUNCATE TABLE erp_cust_az12;

LOAD DATA LOCAL INFILE '/home/tay/dataWareHouse/sql-data-warehouse-project/datasets/source_erp/CUST_AZ12.csv'
INTO TABLE erp_cust_az12
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@cid, @bdate, @gen)
SET
	cid = NULLIF(@cid, ''),
    bdate = NULLIF(@bdate, ''),
    gen = NULLIF(@gen, '');
    
SELECT * FROM erp_cust_az12;
SELECT COUNT(*) FROM erp_cust_az12;

