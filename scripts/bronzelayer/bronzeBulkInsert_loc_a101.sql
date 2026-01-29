/*
	====================================================================
    Description:
		TOTAL ROWS IN FILE 18485:
        TOTAL ROWS ADDED 18484:
        all looks to be correct.
    
	====================================================================
	Script purpose:
		Loads all the data from the csv file into the erp_loc_a101 table. If no value is found then we are adding the null value to represent it.
*/

USE dw_bronze;

TRUNCATE TABLE erp_loc_a101;

LOAD DATA LOCAL INFILE '/home/tay/dataWareHouse/sql-data-warehouse-project/datasets/source_erp/LOC_A101.csv'
INTO TABLE erp_loc_a101
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@cid, @cntry)
SET
	cid = NULLIF(@cid, ''),
    cntry = NULLIF(@cntry, '');
    
SELECT * FROM erp_loc_a101;
SELECT COUNT(*) FROM erp_loc_a101;
