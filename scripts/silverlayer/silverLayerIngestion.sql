/*
    ==============================================================================================================
    SILVER LAYER INGESTION
	ADDED dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP for the metadata.
    Increased the size of cst_marital_status and cst_gndr to 20 as the transformation was larger. (Will probably have to update some other tables later)
	==============================================================================================================
    Script purpose:
		DROPS tables first if they exists so we are able to edit them if needed.
		Uses the bronze layer database (dw_silver) firstly drops the table to start off with before creating new table.
        Following the nameing convention we create the table for the 6 files that need a table each to be created.
        script sets the UTF-16 unicode characters at the table level.
        
		
*/

USE dw_silver;

DROP TABLE IF EXISTS dw_silver.crm_cust_info;

CREATE TABLE dw_silver.crm_cust_info(
	cst_id int,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status CHAR(20),
    cst_gndr CHAR(20),
    cst_create_date DATE,
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
)CHARACTER SET utf16 COLLATE utf16_general_ci;
 
DROP TABLE IF EXISTS dw_silver.crm_prd_info;

CREATE TABLE dw_silver.crm_prd_info(
	prd_id int,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(100),
    prd_cost int,
    prd_line CHAR(5),
    prd_start_dt DATE,
    prd_end_dt DATE,
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_silver.crm_sales_details;

CREATE TABLE dw_silver.crm_sales_details(
	sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id int,
    sls_order_dt int,
    sls_ship_dt int,
    sls_due_dt int,
    sls_sales int,
    sls_quantity int,
    sls_price int,
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_silver.erp_cust_az12;

CREATE TABLE dw_silver.erp_cust_az12(
	cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(20),
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_silver.erp_loc_a101;

CREATE TABLE dw_silver.erp_loc_a101(
	cid VARCHAR(50),
    cntry VARCHAR(60),
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_silver.erp_px_cat_g1v2;

CREATE TABLE dw_silver.erp_px_cat_g1v2(
	id VARCHAR(10),
    cat VARCHAR(50),
    subcat VARCHAR(100),
    maintenance VARCHAR(10),
    dwh_create_date DATETIME DEFAULT CURRENT_TIMESTAMP
)CHARACTER SET utf16 COLLATE utf16_general_ci;