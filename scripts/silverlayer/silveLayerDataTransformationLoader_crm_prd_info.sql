use dw_silver;

INSERT INTO dw_silver.crm_prd_info(
prd_id,
cat_id,
prd_key,
prd_nm,
prd_cost,
prd_line,
prd_start_dt,
prd_end_dt
)
SELECT 
prd_id,
REPLACE(SUBSTRING(prd_key, 1, 5 ),'-','_') AS cat_id,
SUBSTRING(prd_key,7 , LENGTH(prd_key)) AS prd_key,
prd_nm,
IFNULL(prd_cost,0) AS prd_cost,
CASE UPPER(TRIM(prd_line))
	 WHEN 'M' THEN 'Mountain'
	 WHEN 'R' THEN 'Road'
     WHEN 'S' THEN 'Other sales'
     WHEN 'T' THEN 'Touring'
     ELSE 'n\a'
END AS prd_line,
CAST(prd_start_dt AS DATE) AS prd_start_dt,
CAST(LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)- INTERVAL 1 DAY AS DATE) AS prd_end_dt
FROM dw_bronze.crm_prd_info;


/* checking for duplicate primary keys as we need the id unique */
SELECT prd_id, COUNT(*) FROM dw_bronze.crm_prd_info GROUP BY prd_id HAVING COUNT(*) > 1 OR prd_id IS NULL;

SELECT DISTINCT id FROM dw_bronze.erp_px_cat_g1v2;

/* WHERE REPLACE(SUBSTRING(prd_key, 1, 5), '-', '_') NOT IN 
(SELECT DISTINCT id FROM dw_bronze.erp_px_cat_g1v2) Used to filter out after replace and substring.*/

SELECT prd_nm FROM dw_bronze.crm_prd_info WHERE prd_nm != TRIM(prd_nm); 

SELECT prd_cost FROM dw_bronze.crm_prd_info WHERE prd_cost < 0 or prd_cost IS NULL;

SELECT * FROM dw_bronze.crm_prd_info WHERE prd_end_dt < prd_start_dt;
