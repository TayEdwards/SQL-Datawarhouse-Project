/*
	====================================================================
    Description:
		Had a few issues with this one loading into the file and couple errors but all have been sorted, no errors when executing file now. 
        Because I dont know the best standard to deal with missing values iv added NULL values to the rows were there is no value added in the csv file.
        TOTAL ROWS in file: 18495
        TOTAL ROWS ADDED: 18494
        So we have 1 less row cause we skipped the header which seems to be correct.
    
	====================================================================
	Script purpose:
		Loads all the data from the csv file "cust_info.csv' into the crm_cust_info table. If no value is found then we are adding the null value to represent it.
*/
USE dw_bronze;
SHOW VARIABLES LIKE 'secure_file_priv';
LOAD DATA LOCAL INFILE '/home/tay/dataWareHouse/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
INTO TABLE crm_cust_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@cst_id, @cst_key, @cst_firstname, @cst_lastname, @cst_marital_status, @cst_gndr, @cst_create_date)
SET 
	cst_id = NULLIF(@cst_id, ''),
	cst_key = NULLIF(@cst_key, ''),
    cst_firstname = NULLIF(@cst_firstname, ''),
    cst_lastname = NULLIF(@cst_lastname, ''),
    cst_marital_status = NULLIF(@cst_marital_status, ''),
    cst_gndr = NULLIF(@cst_gndr, ''),
    cst_create_date = NULLIF(@cst_create_date, '');

SELECT * FROM crm_cust_info;
SELECT COUNT(*) FROM crm_cust_info;
SELECT * FROM crm_cust_info WHERE cst_firstname = 'Jared';
