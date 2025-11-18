CREATE TABLE bronze.crm_cust_info
(
	cst_id int,
	cst_key nvarchar(50),
	cst_fiestname nvarchar(50),
	cst_lastname nvarchar(50),
	cst_marital_status nvarchar(50),
	cst_gndr nvarchar(50),
	cst_create_date DATE
);

drop table bronze.crm_cust_info

CREATE TABLE bronze.crm_sales_details
(
sls_ord_num nvarchar(50),
sls_prd_key	nvarchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);

CREATE TABLE bronze.crm_prd_info
(
prd_id int,
prd_key nvarchar(50),
prd_nm nvarchar(50),
prd_cost int,
prd_line nvarchar(50),
prd_start_dt date,
prd_end_dt date
);


TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM 'D:\Personal\Others\Harshada Study Material\SQL MATERIALS\sql-ultimate-course\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

--SELECT COUNT(*)
--FROM bronze.crm_cust_info


TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details 
FROM 'D:\Personal\Others\Harshada Study Material\SQL MATERIALS\sql-ultimate-course\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

--SELECT * FROM bronze.crm_sales_details;

TRUNCATE TABLE bronze.crm_prd_info;
BULK INSERT bronze.crm_prd_info 
FROM 'D:\Personal\Others\Harshada Study Material\SQL MATERIALS\sql-ultimate-course\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with
(
firstrow = 2,
fieldterminator = ',',
tablock
);

select * from bronze.crm_prd_info
CREATE TABLE bronze.erp_cust_az12
(
	cid nvarchar(50),
	bdate DATE,
	gen nvarchar(50)
);


drop table bronze.erp_cust_az12;

CREATE TABLE bronze.erp_loc_a101
(
	cid nvarchar(50),
	cntry nvarchar(50)
);

CREATE TABLE BRONZE.erp_px_cat_g1v2
(
	id  nvarchar(50),
	cat nvarchar(50),
	subcat nvarchar(50),
	maintenance nvarchar(50)
)

drop table bronze.erp_cust_az12;

