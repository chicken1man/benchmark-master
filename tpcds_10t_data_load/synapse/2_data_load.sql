COPY INTO tpcds10t.INVENTORY
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/INVENTORY/*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.INVENTORY

COPY INTO tpcds10t.ITEM
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/ITEM/*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.ITEM

COPY INTO tpcds10t.CATALOG_RETURNS
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/CATALOG_RETURNS/*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.CATALOG_RETURNS

COPY INTO tpcds10t.CATALOG_SALES
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/CATALOG_SALES/*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.CATALOG_SALES

COPY INTO tpcds10t.STORE_SALES
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/STORE_SALES/*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.STORE_SALES

COPY INTO tpcds10t.WEB_SALES
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/data_*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.WEB_SALES

COPY INTO tpcds10t.CALL_CENTER
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/CALL_CENTER/CALL_CENTER.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.CALL_CENTER

COPY INTO tpcds10t.DATE_DIM
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/DATE_DIM/DATE_DIM.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.DATE_DIM

COPY INTO tpcds10t.CATALOG_PAGE
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/CATALOG_PAGE/CATALOG_PAGE.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.CATALOG_PAGE

COPY INTO tpcds10t.CUSTOMER_DEMOGRAPHICS
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/CUSTOMER_DEMOGRAPHICS/data_*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.CUSTOMER_DEMOGRAPHICS

COPY INTO tpcds10t.DBGEN_VERSION
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/DBGEN_VERSION/DBGEN_VERSION.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.DBGEN_VERSION

COPY INTO tpcds10t.HOUSEHOLD_DEMOGRAPHICS
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/HOUSEHOLD_DEMOGRAPHICS/HOUSEHOLD_DEMOGRAPHICS.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.HOUSEHOLD_DEMOGRAPHICS

COPY INTO tpcds10t.INCOME_BAND
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/INCOME_BAND/INCOME_BAND.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.INCOME_BAND


COPY INTO tpcds10t.PROMOTION
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/PROMOTION/PROMOTION.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.PROMOTION


COPY INTO tpcds10t.REASON
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/REASON/REASON.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.REASON

COPY INTO tpcds10t.SHIP_MODE
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/SHIP_MODE/SHIP_MODE.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.SHIP_MODE

COPY INTO tpcds10t.STORE
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/STORE/STORE.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.STORE


COPY INTO tpcds10t.TIME_DIM
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/TIME_DIM/TIME_DIM.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.TIME_DIM

COPY INTO tpcds10t.WAREHOUSE
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/WAREHOUSE/WAREHOUSE.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.WAREHOUSE

COPY INTO tpcds10t.WEB_PAGE
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/WEB_PAGE/WEB_PAGE.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.WEB_PAGE

COPY INTO tpcds10t.WEB_SITE
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/WEB_SITE/WEB_SITE.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.WEB_SITE

COPY INTO tpcds10t.WEB_RETURNS
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/WEB_RETURNS/data_*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.WEB_RETURNS

COPY INTO tpcds10t.CUSTOMER
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/CUSTOMER/CUSTOMER*.csv.gz'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = '|',
	FIRSTROW = 1
);

select count(*) from tpcds10t.CUSTOMER

COPY INTO tpcds10t.CUSTOMER_ADDRESS
FROM 'https://asbenchmark.blob.core.windows.net/benchmark/CUSTOMER_ADDRESS/data_*.txt'
WITH (
    FILE_TYPE = 'CSV',
	ENCODING = 'UTF8',
    FIELDTERMINATOR = ',',
	FIRSTROW = 2
);

select count(*) from tpcds10t.CUSTOMER_ADDRESS

--- TPCDS - 10T scale
---Table name	            Row Count
---STORE_RETURNS           	2879898629
---STORE_SALES             	28800239865
---CATALOG_RETURNS         	1440033112
---WEB_SALES               	7199963324
---CATALOG_SALES           	14399964710
---CALL_CENTER             	54
---CATALOG_PAGE            	40000
---CUSTOMER               	65000000
---CUSTOMER_ADDRESS       	32500000
---CUSTOMER_DEMOGRAPHICS	1920800
---DATE_DIM                	73049
---DBGEN_VERSION           	1
---HOUSEHOLD_DEMOGRAPHICS	7200
---INCOME_BAND           	20
---INVENTORY              	1311525000
---ITEM    	                402000
---PROMOTION 	            2000
---REASON                 	70
---SHIP_MODE	            20
---STORE   	                1500
---TIME_DIM                 86400
---WAREHOUSE	            25
---WEB_PAGE	                4002
---WEB_SITE	                78
---WEB_RETURNS	            720020485