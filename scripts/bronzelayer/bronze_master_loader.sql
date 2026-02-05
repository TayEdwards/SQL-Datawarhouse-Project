/*
	====================================================================
    Description:
		Stored procedure to load all the csv files. mySQL doesnt allow you to store prodcures that have INFILE for saftey reasons. Therefore current solution is
        to store all inserts into one file and run it.
	====================================================================
    Data check:
		crm_cust_info: 
			TOTAL ROWS in file: 18495
			TOTAL ROWS ADDED: 18494
		crm_prd_info:
			TOTAL ROWS IN FILE 398
			TOTAL ROWS ADDED 397
		crm_sales_details:
			TOTAL ROWS IN FILE 60399
			TOTAL ROWS ADDED 60398
		erp_cust_az12:
			TOTAL ROWS IN FILE 18485
			TOTAL ROWS ADDED 18484
		erp_loc_a101:
			TOTAL ROWS IN FILE 18485
			TOTAL ROWS ADDED 18484
		erp_px_cat_g1v2:
			TOTAL ROWS IN FILE 38
			TOTAL ROWS ADDED 37
    ====================================================================
	Script purpose:
		Loads all the data from the 6 csv files into their respective tables. Basic queries to check tables at the bottom of script.
*/

USE dw_bronze;

/*=== CRM_CUST_INFO ===*/
TRUNCATE TABLE crm_cust_info;
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

/*=== CRM_PRD_INFO ===*/
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
   
/*=== CRM_SALES_DETAILS ===*/
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

/*=== ERP_CUST_AZ12 ===*/
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

/*=== ERP_LOC_A101 ===*/
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
    
/*=== ERP_PX_CAT_G1V2 ===*/
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
    
SELECT * FROM crm_cust_info;
SELECT COUNT(*) FROM crm_cust_info;
SELECT * FROM crm_prd_info;
SELECT COUNT(*) FROM crm_prd_info;
SELECT * FROM crm_sales_details;
SELECT COUNT(*) FROM crm_sales_details;
SELECT * FROM erp_cust_az12;
SELECT COUNT(*) FROM erp_cust_az12;
SELECT * FROM erp_loc_a101;
SELECT COUNT(*) FROM erp_loc_a101;
SELECT * FROM erp_px_cat_g1v2;
SELECT COUNT(*) FROM erp_px_cat_g1v2;

