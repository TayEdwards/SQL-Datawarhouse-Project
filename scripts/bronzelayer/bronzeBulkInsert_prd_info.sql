/*
	====================================================================
    Description:
		Had to update the char for prd_line from 1 to 5 might need to make all chars up to 10 just to have some wiggle room.
		TOTAL ROWS IN FILE 398:
        TOTAL ROWS ADDED 397:
        all looks to be correct.
    
	====================================================================
	Script purpose:
		Loads all the data from the csv file into the crm_prd_info table. If no value is found then we are adding the null value to represent it.
*/
USE dw_bronze;

TRUNCATE TABLE crm_prd_info;

LOAD DATA LOCAL INFILE '/home/tay/dataWareHouse/sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
INTO TABLE crm_prd_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@prd_id, @prd_key, @prd_nm, @prd_cost, @prd_line, @prd_start_dt, @prd_end_dt)
SET
	prd_id = NULLIF(@prd_id, ''),
	prd_key = NULLIF(@prd_key, ''),
	prd_nm = NULLIF(@prd_nm, ''),
    prd_cost = NULLIF(@prd_cost, ''),
    prd_line = NULLIF(@prd_line, ''),
    prd_start_dt = NULLIF(@prd_start_dt, ''),
    prd_end_dt = NULLIF(@prd_end_dt, '');

SELECT * FROM crm_prd_info;
SELECT COUNT(*) FROM crm_prd_info;
