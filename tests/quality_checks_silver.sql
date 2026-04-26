/*
=================================================================
Quality Checks
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
