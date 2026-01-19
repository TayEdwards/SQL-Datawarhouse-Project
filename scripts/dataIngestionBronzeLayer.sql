/*
    ==============================================================================================================
    BRONZE LAYER INGESTION
    NVARCHAR is SQLserver that sets the character set to UTF-16 encoding 
    However mySQL doesnt have NVARCHAR and is mapped to VARCHAR.
    I should have set the encoding to UTF-16 from the creation of the databases
    eg . CREATE DATABASE dw_bronze CHARACTER SET utf-16 COLLATE utf16_general_ci;
    This is a learning expirence any way so will use CHARACTER SET on table creation instead.
    Wont be hard to change if need be any way.
    
    Also Baraa uses nvarchar(50) for the cst_marital_status & cst_gender but looking at the
    data there is only one character therefore i have opted to use CHAR(1). Will update if changes are needed
	==============================================================================================================
    Script purpose:
		DROPS tables first if they exists so we are able to edit them if needed.
		Uses the bronze layer database (dw_bronze) and following the nameing convention we create the tables, 6 tables one for each file.
        script sets the UTF-16 unicode characters at the table level.
        
		
*/

USE dw_bronze;

DROP TABLE IF EXISTS dw_bronze.crm_cust_info;

CREATE TABLE dw_bronze.crm_cust_info(
	cst_id int,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status CHAR(1),
    cst_gndr CHAR(1),
    cst_create_date DATE
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_bronze.crm_prd_info;

CREATE TABLE dw_bronze.crm_prd_info(
	prd_id int,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(100),
    prd_cost int,
    prd_line CHAR(1),
    prd_start_dt DATE,
    prd_end_dt DATE
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_bronze.crm_sales_details;

CREATE TABLE dw_bronze.crm_sales_details(
	sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id int,
    sls_order_dt int,
    sls_ship_dt int,
    sls_due_dt int,
    sls_sales int,
    sls_quantity int,
    sls_price int
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_bronze.erp_cust_az12;

CREATE TABLE dw_bronze.erp_cust_az12(
	cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(20)
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_bronze.erp_loc_a101;

CREATE TABLE dw_bronze.erp_loc_a101(
	cid VARCHAR(50),
    cntry VARCHAR(60)
)CHARACTER SET utf16 COLLATE utf16_general_ci;

DROP TABLE IF EXISTS dw_bronze.erp_px_cat_g1v2;

CREATE TABLE dw_bronze.erp_px_cat_g1v2(
	id VARCHAR(10),
    cat VARCHAR(50),
    subcat VARCHAR(100),
    Maintenance VARCHAR(10)
)CHARACTER SET utf16 COLLATE utf16_general_ci;
