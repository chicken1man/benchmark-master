-- Table DDL
CREATE TABLE
    `default`.`call_center`
    (
        `CC_CALL_CENTER_SK` BIGINT,
        `CC_CALL_CENTER_ID` STRING,
        `CC_REC_START_DATE` DATE,
        `CC_REC_END_DATE` DATE,
        `CC_CLOSED_DATE_SK` BIGINT,
        `CC_OPEN_DATE_SK` BIGINT,
        `CC_NAME` STRING,
        `CC_CLASS` STRING,
        `CC_EMPLOYEES` BIGINT,
        `CC_SQ_FT` BIGINT,
        `CC_HOURS` STRING,
        `CC_MANAGER` STRING,
        `CC_MKT_ID` BIGINT,
        `CC_MKT_CLASS` STRING,
        `CC_MKT_DESC` STRING,
        `CC_MARKET_MANAGER` STRING,
        `CC_DIVISION` BIGINT,
        `CC_DIVISION_NAME` STRING,
        `CC_COMPANY` BIGINT,
        `CC_COMPANY_NAME` STRING,
        `CC_STREET_NUMBER` STRING,
        `CC_STREET_NAME` STRING,
        `CC_STREET_TYPE` STRING,
        `CC_SUITE_NUMBER` STRING,
        `CC_CITY` STRING,
        `CC_COUNTY` STRING,
        `CC_STATE` STRING,
        `CC_ZIP` STRING,
        `CC_COUNTRY` STRING,
        `CC_GMT_OFFSET` DECIMAL(5,2),
        `CC_TAX_PERCENTAGE` DECIMAL(5,2)
    )
USING DELTA;

CREATE TABLE
    `default`.`catalog_page`
    (
        `CP_CATALOG_PAGE_SK` BIGINT,
        `CP_CATALOG_PAGE_ID` STRING,
        `CP_START_DATE_SK` BIGINT,
        `CP_END_DATE_SK` BIGINT,
        `CP_DEPARTMENT` STRING,
        `CP_CATALOG_NUMBER` BIGINT,
        `CP_CATALOG_PAGE_NUMBER` BIGINT,
        `CP_DESCRIPTION` STRING,
        `CP_TYPE` STRING
    )
USING DELTA;

CREATE TABLE
    `default`.`catalog_returns`
    (
        `CR_RETURNED_DATE_SK` BIGINT,
        `CR_RETURNED_TIME_SK` BIGINT,
        `CR_ITEM_SK` BIGINT,
        `CR_REFUNDED_CUSTOMER_SK` BIGINT,
        `CR_REFUNDED_CDEMO_SK` BIGINT,
        `CR_REFUNDED_HDEMO_SK` BIGINT,
        `CR_REFUNDED_ADDR_SK` BIGINT,
        `CR_RETURNING_CUSTOMER_SK` BIGINT,
        `CR_RETURNING_CDEMO_SK` BIGINT,
        `CR_RETURNING_HDEMO_SK` BIGINT,
        `CR_RETURNING_ADDR_SK` BIGINT,
        `CR_CALL_CENTER_SK` BIGINT,
        `CR_CATALOG_PAGE_SK` BIGINT,
        `CR_SHIP_MODE_SK` BIGINT,
        `CR_WAREHOUSE_SK` BIGINT,
        `CR_REASON_SK` BIGINT,
        `CR_ORDER_NUMBER` BIGINT,
        `CR_RETURN_QUANTITY` BIGINT,
        `CR_RETURN_AMOUNT` DECIMAL(7,2),
        `CR_RETURN_TAX` DECIMAL(7,2),
        `CR_RETURN_AMT_INC_TAX` DECIMAL(7,2),
        `CR_FEE` DECIMAL(7,2),
        `CR_RETURN_SHIP_COST` DECIMAL(7,2),
        `CR_REFUNDED_CASH` DECIMAL(7,2),
        `CR_REVERSED_CHARGE` DECIMAL(7,2),
        `CR_STORE_CREDIT` DECIMAL(7,2),
        `CR_NET_LOSS` DECIMAL(7,2)
    )
USING DELTA;

CREATE TABLE
    `default`.`catalog_sales`
    (
        `CS_SOLD_DATE_SK` BIGINT,
        `CS_SOLD_TIME_SK` BIGINT,
        `CS_SHIP_DATE_SK` BIGINT,
        `CS_BILL_CUSTOMER_SK` BIGINT,
        `CS_BILL_CDEMO_SK` BIGINT,
        `CS_BILL_HDEMO_SK` BIGINT,
        `CS_BILL_ADDR_SK` BIGINT,
        `CS_SHIP_CUSTOMER_SK` BIGINT,
        `CS_SHIP_CDEMO_SK` BIGINT,
        `CS_SHIP_HDEMO_SK` BIGINT,
        `CS_SHIP_ADDR_SK` BIGINT,
        `CS_CALL_CENTER_SK` BIGINT,
        `CS_CATALOG_PAGE_SK` BIGINT,
        `CS_SHIP_MODE_SK` BIGINT,
        `CS_WAREHOUSE_SK` BIGINT,
        `CS_ITEM_SK` BIGINT,
        `CS_PROMO_SK` BIGINT,
        `CS_ORDER_NUMBER` BIGINT,
        `CS_QUANTITY` BIGINT,
        `CS_WHOLESALE_COST` DECIMAL(7,2),
        `CS_LIST_PRICE` DECIMAL(7,2),
        `CS_SALES_PRICE` DECIMAL(7,2),
        `CS_EXT_DISCOUNT_AMT` DECIMAL(7,2),
        `CS_EXT_SALES_PRICE` DECIMAL(7,2),
        `CS_EXT_WHOLESALE_COST` DECIMAL(7,2),
        `CS_EXT_LIST_PRICE` DECIMAL(7,2),
        `CS_EXT_TAX` DECIMAL(7,2),
        `CS_COUPON_AMT` DECIMAL(7,2),
        `CS_EXT_SHIP_COST` DECIMAL(7,2),
        `CS_NET_PAID` DECIMAL(7,2),
        `CS_NET_PAID_INC_TAX` DECIMAL(7,2),
        `CS_NET_PAID_INC_SHIP` DECIMAL(7,2),
        `CS_NET_PAID_INC_SHIP_TAX` DECIMAL(7,2),
        `CS_NET_PROFIT` DECIMAL(7,2)
    )
USING DELTA;

CREATE TABLE
    `default`.`customer`
    (
        `C_CUSTOMER_SK` INT,
        `C_CUSTOMER_ID` STRING,
        `C_CURRENT_CDEMO_SK` INT,
        `C_CURRENT_HDEMO_SK` INT,
        `C_CURRENT_ADDR_SK` INT,
        `C_FIRST_SHIPTO_DATE_SK` INT,
        `C_FIRST_SALES_DATE_SK` INT,
        `C_SALUTATION` STRING,
        `C_FIRST_NAME` STRING,
        `C_LAST_NAME` STRING,
        `C_PREFERRED_CUST_FLAG` STRING,
        `C_BIRTH_DAY` INT,
        `C_BIRTH_MONTH` INT,
        `C_BIRTH_YEAR` INT,
        `C_BIRTH_COUNTRY` STRING,
        `C_LOGIN` STRING,
        `C_EMAIL_ADDRESS` STRING,
        `C_LAST_REVIEW_DATE` INT
    )
USING DELTA;

CREATE TABLE
    `default`.`customer_address`
    (
        `CA_ADDRESS_SK` BIGINT,
        `CA_ADDRESS_ID` STRING,
        `CA_STREET_NUMBER` STRING,
        `CA_STREET_NAME` STRING,
        `CA_STREET_TYPE` STRING,
        `CA_SUITE_NUMBER` STRING,
        `CA_CITY` STRING,
        `CA_COUNTY` STRING,
        `CA_STATE` STRING,
        `CA_ZIP` STRING,
        `CA_COUNTRY` STRING,
        `CA_GMT_OFFSET` DECIMAL(5,2),
        `CA_LOCATION_TYPE` STRING
    )
USING DELTA;

CREATE TABLE
    `default`.`customer_demographics`
    (
        `CD_DEMO_SK` BIGINT,
        `CD_GENDER` STRING,
        `CD_MARITAL_STATUS` STRING,
        `CD_EDUCATION_STATUS` STRING,
        `CD_PURCHASE_ESTIMATE` BIGINT,
        `CD_CREDIT_RATING` STRING,
        `CD_DEP_COUNT` BIGINT,
        `CD_DEP_EMPLOYED_COUNT` BIGINT,
        `CD_DEP_COLLEGE_COUNT` BIGINT
    )
USING DELTA;

CREATE TABLE
    `default`.`date_dim`
    (
        `D_DATE_SK` BIGINT,
        `D_DATE_ID` STRING,
        `D_DATE` DATE,
        `D_MONTH_SEQ` BIGINT,
        `D_WEEK_SEQ` BIGINT,
        `D_QUARTER_SEQ` BIGINT,
        `D_YEAR` BIGINT,
        `D_DOW` BIGINT,
        `D_MOY` BIGINT,
        `D_DOM` BIGINT,
        `D_QOY` BIGINT,
        `D_FY_YEAR` BIGINT,
        `D_FY_QUARTER_SEQ` BIGINT,
        `D_FY_WEEK_SEQ` BIGINT,
        `D_DAY_NAME` STRING,
        `D_QUARTER_NAME` STRING,
        `D_HOLIDAY` STRING,
        `D_WEEKEND` STRING,
        `D_FOLLOWING_HOLIDAY` STRING,
        `D_FIRST_DOM` BIGINT,
        `D_LAST_DOM` BIGINT,
        `D_SAME_DAY_LY` BIGINT,
        `D_SAME_DAY_LQ` BIGINT,
        `D_CURRENT_DAY` STRING,
        `D_CURRENT_WEEK` STRING,
        `D_CURRENT_MONTH` STRING,
        `D_CURRENT_QUARTER` STRING,
        `D_CURRENT_YEAR` STRING
    )
USING DELTA;

CREATE TABLE
    `default`.`dbgen_version`
    (
        `DV_VERSION` STRING,
        `DV_CREATE_DATE` DATE,
        `DV_CREATE_TIME` STRING,
        `DV_CMDLINE_ARGS` STRING
    )
USING DELTA;
CREATE TABLE
    `default`.`household_demographics`
    (
        `HD_DEMO_SK` BIGINT,
        `HD_INCOME_BAND_SK` BIGINT,
        `HD_BUY_POTENTIAL` STRING,
        `HD_DEP_COUNT` BIGINT,
        `HD_VEHICLE_COUNT` BIGINT
    )
USING DELTA;

CREATE TABLE
    `default`.`income_band`
    (
        `IB_INCOME_BAND_SK` BIGINT,
        `IB_LOWER_BOUND` BIGINT,
        `IB_UPPER_BOUND` BIGINT
    )
USING DELTA;

CREATE TABLE
    `default`.`inventory`
    (
        `INV_DATE_SK` BIGINT,
        `INV_ITEM_SK` BIGINT,
        `INV_WAREHOUSE_SK` BIGINT,
        `INV_QUANTITY_ON_HAND` BIGINT
    )
USING DELTA;

CREATE TABLE
    `default`.`item`
    (
        `I_ITEM_SK` INT,
        `I_ITEM_ID` STRING,
        `I_REC_START_DATE` DATE,
        `I_REC_END_DATE` DATE,
        `I_ITEM_DESC` STRING,
        `I_CURRENT_PRICE` DECIMAL(7,2),
        `I_WHOLESALE_COST` DECIMAL(7,2),
        `I_BRAND_ID` INT,
        `I_BRAND` STRING,
        `I_CLASS_ID` INT,
        `I_CLASS` STRING,
        `I_CATEGORY_ID` INT,
        `I_CATEGORY` STRING,
        `I_MANUFACT_ID` INT,
        `I_MANUFACT` STRING,
        `I_SIZE` STRING,
        `I_FORMULATION` STRING,
        `I_COLOR` STRING,
        `I_UNITS` STRING,
        `I_CONTAINER` STRING,
        `I_MANAGER_ID` INT,
        `I_PRODUCT_NAME` STRING
    )
USING DELTA;

CREATE TABLE
    `default`.`promotion`
    (
        `P_PROMO_SK` BIGINT,
        `P_PROMO_ID` STRING,
        `P_START_DATE_SK` BIGINT,
        `P_END_DATE_SK` BIGINT,
        `P_ITEM_SK` BIGINT,
        `P_COST` DECIMAL(15,2),
        `P_RESPONSE_TARGET` BIGINT,
        `P_PROMO_NAME` STRING,
        `P_CHANNEL_DMAIL` STRING,
        `P_CHANNEL_EMAIL` STRING,
        `P_CHANNEL_CATALOG` STRING,
        `P_CHANNEL_TV` STRING,
        `P_CHANNEL_RADIO` STRING,
        `P_CHANNEL_PRESS` STRING,
        `P_CHANNEL_EVENT` STRING,
        `P_CHANNEL_DEMO` STRING,
        `P_CHANNEL_DETAILS` STRING,
        `P_PURPOSE` STRING,
        `P_DISCOUNT_ACTIVE` STRING
    )
USING DELTA;

CREATE TABLE
    `default`.`reason`
    (
        `R_REASON_SK` BIGINT,
        `R_REASON_ID` STRING,
        `R_REASON_DESC` STRING
    )
USING DELTA;

CREATE TABLE
    `default`.`ship_mode`
    (
        `SM_SHIP_MODE_SK` INT,
        `SM_SHIP_MODE_ID` STRING,
        `SM_TYPE` STRING,
        `SM_CODE` STRING,
        `SM_CARRIER` STRING,
        `SM_CONTRACT` STRING
    )
USING DELTA;

CREATE TABLE
    `default`.`store`
    (
        `S_STORE_SK` BIGINT,
        `S_STORE_ID` STRING,
        `S_REC_START_DATE` DATE,
        `S_REC_END_DATE` DATE,
        `S_CLOSED_DATE_SK` BIGINT,
        `S_STORE_NAME` STRING,
        `S_NUMBER_EMPLOYEES` BIGINT,
        `S_FLOOR_SPACE` BIGINT,
        `S_HOURS` STRING,
        `S_MANAGER` STRING,
        `S_MARKET_ID` BIGINT,
        `S_GEOGRAPHY_CLASS` STRING,
        `S_MARKET_DESC` STRING,
        `S_MARKET_MANAGER` STRING,
        `S_DIVISION_ID` BIGINT,
        `S_DIVISION_NAME` STRING,
        `S_COMPANY_ID` BIGINT,
        `S_COMPANY_NAME` STRING,
        `S_STREET_NUMBER` STRING,
        `S_STREET_NAME` STRING,
        `S_STREET_TYPE` STRING,
        `S_SUITE_NUMBER` STRING,
        `S_CITY` STRING,
        `S_COUNTY` STRING,
        `S_STATE` STRING,
        `S_ZIP` STRING,
        `S_COUNTRY` STRING,
        `S_GMT_OFFSET` DECIMAL(5,2),
        `S_TAX_PRECENTAGE` DECIMAL(5,2)
    )
USING DELTA;

CREATE TABLE
    `default`.`store_returns`
    (
        `SR_RETURNED_DATE_SK` BIGINT,
        `SR_RETURN_TIME_SK` BIGINT,
        `SR_ITEM_SK` BIGINT,
        `SR_CUSTOMER_SK` BIGINT,
        `SR_CDEMO_SK` BIGINT,
        `SR_HDEMO_SK` BIGINT,
        `SR_ADDR_SK` BIGINT,
        `SR_STORE_SK` BIGINT,
        `SR_REASON_SK` BIGINT,
        `SR_TICKET_NUMBER` BIGINT,
        `SR_RETURN_QUANTITY` BIGINT,
        `SR_RETURN_AMT` DECIMAL(7,2),
        `SR_RETURN_TAX` DECIMAL(7,2),
        `SR_RETURN_AMT_INC_TAX` DECIMAL(7,2),
        `SR_FEE` DECIMAL(7,2),
        `SR_RETURN_SHIP_COST` DECIMAL(7,2),
        `SR_REFUNDED_CASH` DECIMAL(7,2),
        `SR_REVERSED_CHARGE` DECIMAL(7,2),
        `SR_STORE_CREDIT` DECIMAL(7,2),
        `SR_NET_LOSS` DECIMAL(7,2)
    )
USING DELTA;

CREATE TABLE
    `default`.`store_sales`
    (
        `SS_SOLD_DATE_SK` BIGINT,
        `SS_SOLD_TIME_SK` BIGINT,
        `SS_ITEM_SK` BIGINT,
        `SS_CUSTOMER_SK` BIGINT,
        `SS_CDEMO_SK` BIGINT,
        `SS_HDEMO_SK` BIGINT,
        `SS_ADDR_SK` BIGINT,
        `SS_STORE_SK` BIGINT,
        `SS_PROMO_SK` BIGINT,
        `SS_TICKET_NUMBER` BIGINT,
        `SS_QUANTITY` BIGINT,
        `SS_WHOLESALE_COST` DECIMAL(7,2),
        `SS_LIST_PRICE` DECIMAL(7,2),
        `SS_SALES_PRICE` DECIMAL(7,2),
        `SS_EXT_DISCOUNT_AMT` DECIMAL(7,2),
        `SS_EXT_SALES_PRICE` DECIMAL(7,2),
        `SS_EXT_WHOLESALE_COST` DECIMAL(7,2),
        `SS_EXT_LIST_PRICE` DECIMAL(7,2),
        `SS_EXT_TAX` DECIMAL(7,2),
        `SS_COUPON_AMT` DECIMAL(7,2),
        `SS_NET_PAID` DECIMAL(7,2),
        `SS_NET_PAID_INC_TAX` DECIMAL(7,2),
        `SS_NET_PROFIT` DECIMAL(7,2)
    )
USING
    DELTA;

CREATE TABLE
    `default`.`time_dim`
    (
        `T_TIME_SK` BIGINT,
        `T_TIME_ID` STRING,
        `T_TIME` BIGINT,
        `T_HOUR` BIGINT,
        `T_MINUTE` BIGINT,
        `T_SECOND` BIGINT,
        `T_AM_PM` STRING,
        `T_SHIFT` STRING,
        `T_SUB_SHIFT` STRING,
        `T_MEAL_TIME` STRING
    )
USING DELTA;

CREATE TABLE
    `default`.`warehouse`
    (
        `W_WAREHOUSE_SK` BIGINT,
        `W_WAREHOUSE_ID` STRING,
        `W_WAREHOUSE_NAME` STRING,
        `W_WAREHOUSE_SQ_FT` BIGINT,
        `W_STREET_NUMBER` STRING,
        `W_STREET_NAME` STRING,
        `W_STREET_TYPE` STRING,
        `W_SUITE_NUMBER` STRING,
        `W_CITY` STRING,
        `W_COUNTY` STRING,
        `W_STATE` STRING,
        `W_ZIP` STRING,
        `W_COUNTRY` STRING,
        `W_GMT_OFFSET` DECIMAL(5,2)
    )
USING DELTA;

CREATE TABLE
    `default`.`web_page`
    (
        `WP_WEB_PAGE_SK` BIGINT,
        `WP_WEB_PAGE_ID` STRING,
        `WP_REC_START_DATE` DATE,
        `WP_REC_END_DATE` DATE,
        `WP_CREATION_DATE_SK` BIGINT,
        `WP_ACCESS_DATE_SK` BIGINT,
        `WP_AUTOGEN_FLAG` STRING,
        `WP_CUSTOMER_SK` BIGINT,
        `WP_URL` STRING,
        `WP_TYPE` STRING,
        `WP_CHAR_COUNT` BIGINT,
        `WP_LINK_COUNT` BIGINT,
        `WP_IMAGE_COUNT` BIGINT,
        `WP_MAX_AD_COUNT` BIGINT
    )
USING DELTA;

CREATE TABLE
    `default`.`web_returns`
    (
        `WR_RETURNED_DATE_SK` INT,
        `WR_RETURNED_TIME_SK` INT,
        `WR_ITEM_SK` INT,
        `WR_REFUNDED_CUSTOMER_SK` INT,
        `WR_REFUNDED_CDEMO_SK` INT,
        `WR_REFUNDED_HDEMO_SK` INT,
        `WR_REFUNDED_ADDR_SK` INT,
        `WR_RETURNING_CUSTOMER_SK` INT,
        `WR_RETURNING_CDEMO_SK` INT,
        `WR_RETURNING_HDEMO_SK` INT,
        `WR_RETURNING_ADDR_SK` INT,
        `WR_WEB_PAGE_SK` INT,
        `WR_REASON_SK` INT,
        `WR_ORDER_NUMBER` INT,
        `WR_RETURN_QUANTITY` INT,
        `WR_RETURN_AMT` DOUBLE,
        `WR_RETURN_TAX` DOUBLE,
        `WR_RETURN_AMT_INC_TAX` DOUBLE,
        `WR_FEE` DOUBLE,
        `WR_RETURN_SHIP_COST` DOUBLE,
        `WR_REFUNDED_CASH` DOUBLE,
        `WR_REVERSED_CHARGE` DOUBLE,
        `WR_ACCOUNT_CREDIT` DOUBLE,
        `WR_NET_LOSS` DOUBLE
    )
USING DELTA;

CREATE TABLE
    `default`.`web_sales`
    (
        `WS_SOLD_DATE_SK` INT,
        `WS_SOLD_TIME_SK` INT,
        `WS_SHIP_DATE_SK` INT,
        `WS_ITEM_SK` INT,
        `WS_BILL_CUSTOMER_SK` INT,
        `WS_BILL_CDEMO_SK` INT,
        `WS_BILL_HDEMO_SK` INT,
        `WS_BILL_ADDR_SK` INT,
        `WS_SHIP_CUSTOMER_SK` INT,
        `WS_SHIP_CDEMO_SK` INT,
        `WS_SHIP_HDEMO_SK` INT,
        `WS_SHIP_ADDR_SK` INT,
        `WS_WEB_PAGE_SK` INT,
        `WS_WEB_SITE_SK` INT,
        `WS_SHIP_MODE_SK` INT,
        `WS_WAREHOUSE_SK` INT,
        `WS_PROMO_SK` INT,
        `WS_ORDER_NUMBER` INT,
        `WS_QUANTITY` INT,
        `WS_WHOLESALE_COST` DOUBLE,
        `WS_LIST_PRICE` DOUBLE,
        `WS_SALES_PRICE` DOUBLE,
        `WS_EXT_DISCOUNT_AMT` DOUBLE,
        `WS_EXT_SALES_PRICE` DOUBLE,
        `WS_EXT_WHOLESALE_COST` DOUBLE,
        `WS_EXT_LIST_PRICE` DOUBLE,
        `WS_EXT_TAX` DOUBLE,
        `WS_COUPON_AMT` DOUBLE,
        `WS_EXT_SHIP_COST` DOUBLE,
        `WS_NET_PAID` DOUBLE,
        `WS_NET_PAID_INC_TAX` DOUBLE,
        `WS_NET_PAID_INC_SHIP` DOUBLE,
        `WS_NET_PAID_INC_SHIP_TAX` DOUBLE,
        `WS_NET_PROFIT` DOUBLE
    )
USING
    DELTA;

CREATE TABLE
    `default`.`web_site`
    (
        `WEB_SITE_SK` BIGINT,
        `WEB_SITE_ID` STRING,
        `WEB_REC_START_DATE` DATE,
        `WEB_REC_END_DATE` DATE,
        `WEB_NAME` STRING,
        `WEB_OPEN_DATE_SK` BIGINT,
        `WEB_CLOSE_DATE_SK` BIGINT,
        `WEB_CLASS` STRING,
        `WEB_MANAGER` STRING,
        `WEB_MKT_ID` BIGINT,
        `WEB_MKT_CLASS` STRING,
        `WEB_MKT_DESC` STRING,
        `WEB_MARKET_MANAGER` STRING,
        `WEB_COMPANY_ID` BIGINT,
        `WEB_COMPANY_NAME` STRING,
        `WEB_STREET_NUMBER` STRING,
        `WEB_STREET_NAME` STRING,
        `WEB_STREET_TYPE` STRING,
        `WEB_SUITE_NUMBER` STRING,
        `WEB_CITY` STRING,
        `WEB_COUNTY` STRING,
        `WEB_STATE` STRING,
        `WEB_ZIP` STRING,
        `WEB_COUNTRY` STRING,
        `WEB_GMT_OFFSET` DECIMAL(5,2),
        `WEB_TAX_PERCENTAGE` DECIMAL(5,2)
    )
USING DELTA;

-- Analyze
ANALYZE TABLE default.call_center COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.catalog_page COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.catalog_returns COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.catalog_sales COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.customer COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.customer_address COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.customer_demographics COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.date_dim COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.dbgen_version COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.household_demographics COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.income_band COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.inventory COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.item COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.promotion COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.reason COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.ship_mode COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.store COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.store_returns COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.store_sales COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.time_dim COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.warehouse COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.web_page COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.web_returns COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.web_sales COMPUTE STATISTICS FOR ALL COLUMNS;
ANALYZE TABLE default.web_site COMPUTE STATISTICS FOR ALL COLUMNS;

-- Optimize
OPTIMIZE default.call_center;
OPTIMIZE default.catalog_page;
OPTIMIZE default.catalog_returns zorder by cr_returned_date_sk;
OPTIMIZE default.catalog_sales zorder by cs_sold_date_sk;
OPTIMIZE default.customer;
OPTIMIZE default.customer_address;
OPTIMIZE default.customer_demographics;
OPTIMIZE default.date_dim;
OPTIMIZE default.dbgen_version;
OPTIMIZE default.household_demographics;
OPTIMIZE default.income_band;
OPTIMIZE default.inventory;
OPTIMIZE default.item;
OPTIMIZE default.promotion;
OPTIMIZE default.reason;
OPTIMIZE default.ship_mode;
OPTIMIZE default.store;
OPTIMIZE default.store_returns zorder by sr_returned_date_sk;
OPTIMIZE default.store_sales zorder by ss_sold_date_sk;
OPTIMIZE default.time_dim;
OPTIMIZE default.warehouse;
OPTIMIZE default.web_page;
OPTIMIZE default.web_returns zorder by wr_returned_date_sk;
OPTIMIZE default.web_sales zorder by ws_sold_date_sk;
OPTIMIZE default.web_site;

-- HLL Support
CREATE SCHEMA udafschema;

USE udafschema;

DROP FUNCTION IF EXISTS atscale_honeybee_version;

DROP FUNCTION IF EXISTS hll_estimate;

DROP FUNCTION IF EXISTS hll_aggregate;

DROP FUNCTION IF EXISTS hll_aggregate_estimate;

DROP FUNCTION IF EXISTS hll_aggregate_merge;

CREATE FUNCTION atscale_honeybee_version AS 'com.atscale.honeybee.HoneyBeeVersionUDF' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

CREATE FUNCTION hll_estimate AS 'com.atscale.honeybee.hyperloglog.HyperLogLogEstimateUDA' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

CREATE FUNCTION hll_aggregate_merge AS 'com.atscale.honeybee.hyperloglog.HyperLogLogAggregateMergeUDA' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

CREATE FUNCTION hll_aggregate_estimate AS 'com.atscale.honeybee.hyperloglog.HyperLogLogAggregateEstimateUDA' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

CREATE FUNCTION hll_aggregate AS 'com.atscale.honeybee.hyperloglog.HyperLogLogAggregateUDA' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

DROP FUNCTION IF EXISTS quantile_sketch;

DROP FUNCTION IF EXISTS quantile_estimate;

DROP FUNCTION IF EXISTS quantile_sketch_merge;

DROP FUNCTION IF EXISTS quantilefromsketch;

CREATE FUNCTION quantile_sketch AS 'com.atscale.honeybee.quantile.QuantileAggregateUDA' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

CREATE FUNCTION quantile_estimate AS 'com.atscale.honeybee.quantile.QuantileEstimateUDA' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

CREATE FUNCTION quantile_sketch_merge AS 'com.atscale.honeybee.quantile.QuantileMergeUDA' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

CREATE FUNCTION quantilefromsketch AS 'com.atscale.honeybee.quantile.QuantileEstimateFromSketchUDF' USING JAR 'dbfs:/FileStore/jars/3fd69b52_1838_4999_8642_9398afd54cda-honeybee_hive_4_0_68-9dc56.jar';

SELECT hll_estimate(1);
