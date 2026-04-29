/*
=================================================================
Quality Checks Silver Layer
=================================================================
Script Purpose:
  This script performs various quality checks for data consistency, accuracy,
  and standardization across the 'silver' schemas. It includes checks for:
  - Null or duplicate primary keys.
  - Unwanted spaces in string fields.
  - Data standardization and consistency.
  - Invalid date ranges and orders.
  - Data consistency between related fields. 

Usage Notes:
  - Run these checks after data loading Silver layer.
  - Investigate and resolve any discepancies found during the checks. 
=================================================================
*/

--=================================================================
-- CRM Tables
--=================================================================

--=================================================================
-- Check 'silver.crm_cust_info'
--=================================================================
SELECT * FROM silver.crm_cust_info;

DROP TABLE silver.crm_cust_info

SELECT cst_id, 
COUNT(*) duplicate
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL


SELECT *
FROM silver.crm_cust_info
WHERE cst_id IS NULL

-- Selecting all table without duplicates
/* Duplicates in this table is the oldest records */
SELECT *
FROM (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) flag_last
FROM silver.crm_cust_info
)t WHERE flag_last = 1


-- Check for unwanted Spaces
-- Expectation: No Results
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Check for unwanted Spaces
-- Expectation: No Results
SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

-- Data Standardization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info


--=================================================================
-- Check 'silver.crm_prd_info'
--=================================================================

-- Check null data or Duplicate
SELECT prd_id, 
COUNT(*) duplicate
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for unwanted Spaces
-- Expectation: No Results
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for unwanted Spaces
-- Expectation: No Results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0

SELECT distinct prd_line from silver.crm_prd_info

-- Check for Invalid Date Orders
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt


--===================================================================
-- Check 'silver.crm_sales_details'
--===================================================================
-- Check if there's newer sls_order_dt than sls_due_dt & sls_ship_dt
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_due_dt OR sls_order_dt > sls_ship_dt


-- Check if inconsistency calculations, null data, or negative
SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details 
WHERE sls_sales != sls_quantity*sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price



--=================================================================
-- ERP Tables
--=================================================================

--================================================================
-- Check 'silver.erp_cust_az12'
--================================================================
-- Check if bdate column has older data or future data
SELECT DISTINCT
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Check unique value in gen column
SELECT DISTINCT
gen
FROM silver.erp_cust_az12

--================================================================
-- Check 'silver.erp_loc_a101'
--================================================================
-- Check unique value in country 
SELECT DISTINCT cntry
FROM silver.erp_loc_a101

--================================================================
-- Check 'silver.erp_px_cat_g1v2'
--================================================================
-- Check for each value of column has no unwanted spaces
SELECT id
FROM silver.erp_px_cat_g1v2
WHERE id != TRIM(id) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance) 

-- Check if there's any duplicate or NULL values in 'id'
SELECT id, COUNT(*) AS dupli
FROM silver.erp_px_cat_g1v2
GROUP BY id
HAVING id IS NULL OR count(*) > 1

-- Check unique value in 'cat' 
SELECT DISTINCT cat
FROM silver.erp_px_cat_g1v2
