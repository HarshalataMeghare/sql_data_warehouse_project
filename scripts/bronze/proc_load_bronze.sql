

DROP PROCEDURE bronze.load_bronze;

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
 DECLARE @START_TIME DATETIME, @END_TIME DATETIME, @PROGSTARTTIME DATETIME, @PROGENDTIME DATETIME;
  BEGIN TRY
   SET @PROGSTARTTIME = GETDATE();
  PRINT '-------------------------';
  PRINT 'LOADING DATA INTO bronze.erp_cust_az12 TABLE';
  PRINT '-------------------------';
  SET @START_TIME = GETDATE();
	TRUNCATE TABLE bronze.erp_cust_az12;
	BULK INSERT bronze.erp_cust_az12
	FROM 'D:\Personal\Others\Harshada Study Material\SQL MATERIALS\sql-ultimate-course\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
  SET @END_TIME = GETDATE();
  PRINT 'lOADING TIME : ' + CAST( DATEDIFF(SECOND, @START_TIME, @END_TIME ) AS NVARCHAR ) + ' SECONDS' ;
  PRINT 'DATA LOAD COMPLETED FOR TABLE bronze.erp_cust_az12';

	--select * from bronze.erp_cust_az12;
  PRINT '-------------------------';
  PRINT 'LOADING DATA INTO bronze.erp_loc_a101 TABLE';
  PRINT '-------------------------';
	TRUNCATE TABLE bronze.erp_loc_a101;
	BULK INSERT bronze.erp_loc_a101
	FROM 'D:\Personal\Others\Harshada Study Material\SQL MATERIALS\sql-ultimate-course\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\LOC_A101.CSV'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);
 PRINT 'DATA LOAD COMPLETED FOR TABLE bronze.erp_loc_a101';

	--SELECT * FROM bronze.erp_loc_a101

	TRUNCATE TABLE BRONZE.erp_px_cat_g1v2;
	BULK INSERT BRONZE.erp_px_cat_g1v2
	FROM 'D:\Personal\Others\Harshada Study Material\SQL MATERIALS\sql-ultimate-course\f78e076e5b83435d84c6b6af75d8a679\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
	);

	--SELECT * FROM BRONZE.erp_px_cat_g1v2;
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

SET @PROGENDTIME = GETDATE();
  PRINT 'LOADING TIME FOR WHOLE DATA LOAD :' + CAST (DATEDIFF(SECOND,@START_TIME, @PROGENDTIME) AS NVARCHAR) + 'SECONDS';
--select * from bronze.crm_prd_info
  END TRY
  BEGIN CATCH
  PRINT '--------------------------------------------'
  PRINT 'ERROR OCCURED WHILE LOADING BRONZE DATA ';
  PRINT ' ERROR MESSAGE ' + ERROR_MESSAGE ();


  --PRINT 'lOADING TIME : ' + CAST( DATEDIFF(SECOND, @PROGSTARTTIME, @END_TIME ) AS NVARCHAR ) + ' SECONDS' ;
  END CATCH
END




EXEC bronze.load_bronze
