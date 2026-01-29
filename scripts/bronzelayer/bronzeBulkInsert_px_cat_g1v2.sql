/*
	====================================================================
    Description:
		TOTAL ROWS IN FILE 38:
        TOTAL ROWS ADDED 37:
        all looks to be correct.
    
	====================================================================
	Script purpose:
		Loads all the data from the csv file into the erp_px_cat_g1v2 table. If no value is found then we are adding the null value to represent it.
*/

USE dw_bronze;

TRUNCATE TABLE erp_px_cat_g1v2;

LOAD DATA LOCAL INFILE '/home/tay/dataWareHouse/sql-data-warehouse-project/datasets/source_erp/PX_CAT_G1V2.csv'
INTO TABLE erp_px_cat_g1v2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@id, @cat, @subcat, @maintenance)
SET
	id = NULLIF(@id, ''),
    cat = NULLIF(@cat, ''),
    subcat = NULLIF(@subcat, ''),
    maintenance = NULLIF(@maintenance, '');
    
SELECT * FROM erp_px_cat_g1v2;
SELECT COUNT(*) FROM erp_px_cat_g1v2;
