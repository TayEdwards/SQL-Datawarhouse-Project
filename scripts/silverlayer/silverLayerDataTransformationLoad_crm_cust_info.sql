USE dw_bronze;

/* clean the data */
INSERT INTO dw_silver.crm_cust_info(
cst_id,
cst_key,
cst_firstname,
cst_lastname,
cst_marital_status,
cst_gndr,
cst_create_date
)
SELECT 
cst_id,
cst_key,
TRIM(cst_firstname) AS cst_firstname,
TRIM(cst_lastname) AS cst_lastname,
CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
	WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
    ELSE 'n/a'
END AS cst_marital_status,
CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
	WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
    ELSE 'n/a'
END AS cst_gndr,
cst_create_date
FROM (
	SELECT *, ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC, cst_key DESC) as flag_last 
	FROM crm_cust_info
	WHERE cst_id IS NOT NULL
)t WHERE flag_last = 1;

/** Error Code: 1406. Data too long for column 'cst_marital_status' at row 1 **/


USE dw_silver;

/* checking for duplicates in the primary key */
SELECT cst_id, COUNT(*) FROM crm_cust_info GROUP BY cst_id HAVING COUNT(*) > 1 OR cst_id IS NULL;

/* Looking at 29466 we can see the cst_create date 2026-01-27. which is the most up to date logged.*/
SELECT * FROM crm_cust_info WHERE cst_id = 29466;

/* check for unwated spaces in string values */
-- expectation: No results
SELECT cst_id FROM crm_cust_info WHERE cst_id != TRIM(cst_id); /*good*/
SELECT cst_key FROM crm_cust_info WHERE cst_key != TRIM(cst_key); /*good*/
SELECT cst_firstname FROM crm_cust_info WHERE cst_firstname != TRIM(cst_firstname); /*found spaces*/
SELECT cst_lastname FROM crm_cust_info WHERE cst_lastname != TRIM(cst_lastname); /*found spaces*/
SELECT cst_marital_status FROM crm_cust_info WHERE cst_marital_status != TRIM(cst_marital_status); /*good*/
SELECT cst_gndr FROM crm_cust_info WHERE cst_gndr != TRIM(cst_gndr); /*good*/

/* check consistency of values in low cardinality columns */
/* we want to change the m to full values eg M = male */
-- Data Standardization & Consistency
SELECT DISTINCT cst_gndr FROM crm_cust_info;
SELECT DISTINCT cst_marital_status FROM crm_cust_info;

SELECT COUNT(*) AS null_dates
FROM dw_silver.crm_cust_info
WHERE cst_create_date IS NULL;

