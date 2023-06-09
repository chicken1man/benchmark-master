--- create schema
create schema tpcds10t;

CREATE TABLE tpcds10t.[CALL_CENTER]
(
	[CC_CALL_CENTER_SK] [bigint] NOT NULL,
	[CC_CALL_CENTER_ID] [varchar](16) NOT NULL,
	[CC_REC_START_DATE] [date] NULL,
	[CC_REC_END_DATE] [date] NULL,
	[CC_CLOSED_DATE_SK] [bigint] NULL,
	[CC_OPEN_DATE_SK] [bigint] NULL,
	[CC_NAME] [varchar](50) NULL,
	[CC_CLASS] [varchar](50) NULL,
	[CC_EMPLOYEES] [bigint] NULL,
	[CC_SQ_FT] [bigint] NULL,
	[CC_HOURS] [varchar](20) NULL,
	[CC_MANAGER] [varchar](40) NULL,
	[CC_MKT_ID] [bigint] NULL,
	[CC_MKT_CLASS] [varchar](50) NULL,
	[CC_MKT_DESC] [varchar](100) NULL,
	[CC_MARKET_MANAGER] [varchar](40) NULL,
	[CC_DIVISION] [bigint] NULL,
	[CC_DIVISION_NAME] [varchar](50) NULL,
	[CC_COMPANY] [bigint] NULL,
	[CC_COMPANY_NAME] [varchar](50) NULL,
	[CC_STREET_NUMBER] [varchar](10) NULL,
	[CC_STREET_NAME] [varchar](60) NULL,
	[CC_STREET_TYPE] [varchar](15) NULL,
	[CC_SUITE_NUMBER] [varchar](10) NULL,
	[CC_CITY] [varchar](60) NULL,
	[CC_COUNTY] [varchar](30) NULL,
	[CC_STATE] [varchar](2) NULL,
	[CC_ZIP] [varchar](10) NULL,
	[CC_COUNTRY] [varchar](20) NULL,
	[CC_GMT_OFFSET] [decimal](5, 2) NULL,
	[CC_TAX_PERCENTAGE] [decimal](5, 2) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (CC_CALL_CENTER_SK)
);

CREATE TABLE tpcds10t.[CATALOG_PAGE]
(
	[CP_CATALOG_PAGE_SK] [bigint] NOT NULL,
	[CP_CATALOG_PAGE_ID] [varchar](16) NOT NULL,
	[CP_START_DATE_SK] [bigint] NULL,
	[CP_END_DATE_SK] [bigint] NULL,
	[CP_DEPARTMENT] [varchar](50) NULL,
	[CP_CATALOG_NUMBER] [bigint] NULL,
	[CP_CATALOG_PAGE_NUMBER] [bigint] NULL,
	[CP_DESCRIPTION] [varchar](100) NULL,
	[CP_TYPE] [varchar](100) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (CP_CATALOG_PAGE_SK)
);

CREATE TABLE tpcds10t.[CATALOG_RETURNS]
(
	[CR_RETURNED_DATE_SK] [bigint] NULL,
	[CR_RETURNED_TIME_SK] [bigint] NULL,
	[CR_ITEM_SK] [bigint] NOT NULL,
	[CR_REFUNDED_CUSTOMER_SK] [bigint] NULL,
	[CR_REFUNDED_CDEMO_SK] [bigint] NULL,
	[CR_REFUNDED_HDEMO_SK] [bigint] NULL,
	[CR_REFUNDED_ADDR_SK] [bigint] NULL,
	[CR_RETURNING_CUSTOMER_SK] [bigint] NULL,
	[CR_RETURNING_CDEMO_SK] [bigint] NULL,
	[CR_RETURNING_HDEMO_SK] [bigint] NULL,
	[CR_RETURNING_ADDR_SK] [bigint] NULL,
	[CR_CALL_CENTER_SK] [bigint] NULL,
	[CR_CATALOG_PAGE_SK] [bigint] NULL,
	[CR_SHIP_MODE_SK] [bigint] NULL,
	[CR_WAREHOUSE_SK] [bigint] NULL,
	[CR_REASON_SK] [bigint] NULL,
	[CR_ORDER_NUMBER] [bigint] NOT NULL,
	[CR_RETURN_QUANTITY] [bigint] NULL,
	[CR_RETURN_AMOUNT] [decimal](7, 2) NULL,
	[CR_RETURN_TAX] [decimal](7, 2) NULL,
	[CR_RETURN_AMT_INC_TAX] [decimal](7, 2) NULL,
	[CR_FEE] [decimal](7, 2) NULL,
	[CR_RETURN_SHIP_COST] [decimal](7, 2) NULL,
	[CR_REFUNDED_CASH] [decimal](7, 2) NULL,
	[CR_REVERSED_CHARGE] [decimal](7, 2) NULL,
	[CR_STORE_CREDIT] [decimal](7, 2) NULL,
	[CR_NET_LOSS] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX ORDER (CR_RETURNED_DATE_SK, CR_ITEM_SK)
);

CREATE TABLE tpcds10t.[CATALOG_SALES]
(
	[CS_SOLD_DATE_SK] [bigint] NULL,
	[CS_SOLD_TIME_SK] [bigint] NULL,
	[CS_SHIP_DATE_SK] [bigint] NULL,
	[CS_BILL_CUSTOMER_SK] [bigint] NULL,
	[CS_BILL_CDEMO_SK] [bigint] NULL,
	[CS_BILL_HDEMO_SK] [bigint] NULL,
	[CS_BILL_ADDR_SK] [bigint] NULL,
	[CS_SHIP_CUSTOMER_SK] [bigint] NULL,
	[CS_SHIP_CDEMO_SK] [bigint] NULL,
	[CS_SHIP_HDEMO_SK] [bigint] NULL,
	[CS_SHIP_ADDR_SK] [bigint] NULL,
	[CS_CALL_CENTER_SK] [bigint] NULL,
	[CS_CATALOG_PAGE_SK] [bigint] NULL,
	[CS_SHIP_MODE_SK] [bigint] NULL,
	[CS_WAREHOUSE_SK] [bigint] NULL,
	[CS_ITEM_SK] [bigint] NOT NULL,
	[CS_PROMO_SK] [bigint] NULL,
	[CS_ORDER_NUMBER] [bigint] NOT NULL,
	[CS_QUANTITY] [bigint] NULL,
	[CS_WHOLESALE_COST] [decimal](7, 2) NULL,
	[CS_LIST_PRICE] [decimal](7, 2) NULL,
	[CS_SALES_PRICE] [decimal](7, 2) NULL,
	[CS_EXT_DISCOUNT_AMT] [decimal](7, 2) NULL,
	[CS_EXT_SALES_PRICE] [decimal](7, 2) NULL,
	[CS_EXT_WHOLESALE_COST] [decimal](7, 2) NULL,
	[CS_EXT_LIST_PRICE] [decimal](7, 2) NULL,
	[CS_EXT_TAX] [decimal](7, 2) NULL,
	[CS_COUPON_AMT] [decimal](7, 2) NULL,
	[CS_EXT_SHIP_COST] [decimal](7, 2) NULL,
	[CS_NET_PAID] [decimal](7, 2) NULL,
	[CS_NET_PAID_INC_TAX] [decimal](7, 2) NULL,
	[CS_NET_PAID_INC_SHIP] [decimal](7, 2) NULL,
	[CS_NET_PAID_INC_SHIP_TAX] [decimal](7, 2) NULL,
	[CS_NET_PROFIT] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH(CS_ITEM_SK),
	CLUSTERED COLUMNSTORE INDEX ORDER (CS_SOLD_DATE_SK, CS_ITEM_SK)
);

CREATE TABLE tpcds10t.[CUSTOMER]
(
	[C_CUSTOMER_SK] [bigint] NOT NULL,
	[C_CUSTOMER_ID] [varchar](16) NOT NULL,
	[C_CURRENT_CDEMO_SK] [bigint] NULL,
	[C_CURRENT_HDEMO_SK] [bigint] NULL,
	[C_CURRENT_ADDR_SK] [bigint] NULL,
	[C_FIRST_SHIPTO_DATE_SK] [bigint] NULL,
	[C_FIRST_SALES_DATE_SK] [bigint] NULL,
	[C_SALUTATION] [varchar](10) NULL,
	[C_FIRST_NAME] [varchar](20) NULL,
	[C_LAST_NAME] [varchar](30) NULL,
	[C_PREFERRED_CUST_FLAG] [varchar](1) NULL,
	[C_BIRTH_DAY] [bigint] NULL,
	[C_BIRTH_MONTH] [bigint] NULL,
	[C_BIRTH_YEAR] [bigint] NULL,
	[C_BIRTH_COUNTRY] [varchar](20) NULL,
	[C_LOGIN] [varchar](13) NULL,
	[C_EMAIL_ADDRESS] [varchar](50) NULL,
	[C_LAST_REVIEW_DATE] [varchar](10) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (C_CUSTOMER_SK)
);

CREATE TABLE tpcds10t.[CUSTOMER_ADDRESS]
(
	[CA_ADDRESS_SK] [bigint] NOT NULL,
	[CA_ADDRESS_ID] [varchar](16) NOT NULL,
	[CA_STREET_NUMBER] [varchar](10) NULL,
	[CA_STREET_NAME] [varchar](60) NULL,
	[CA_STREET_TYPE] [varchar](15) NULL,
	[CA_SUITE_NUMBER] [varchar](10) NULL,
	[CA_CITY] [varchar](60) NULL,
	[CA_COUNTY] [varchar](30) NULL,
	[CA_STATE] [varchar](2) NULL,
	[CA_ZIP] [varchar](10) NULL,
	[CA_COUNTRY] [varchar](20) NULL,
	[CA_GMT_OFFSET] [decimal](5, 2) NULL,
	[CA_LOCATION_TYPE] [varchar](20) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (CA_ADDRESS_SK)
);

CREATE TABLE tpcds10t.[CUSTOMER_DEMOGRAPHICS]
(
	[CD_DEMO_SK] [bigint] NOT NULL,
	[CD_GENDER] [varchar](1) NULL,
	[CD_MARITAL_STATUS] [varchar](1) NULL,
	[CD_EDUCATION_STATUS] [varchar](20) NULL,
	[CD_PURCHASE_ESTIMATE] [bigint] NULL,
	[CD_CREDIT_RATING] [varchar](10) NULL,
	[CD_DEP_COUNT] [bigint] NULL,
	[CD_DEP_EMPLOYED_COUNT] [bigint] NULL,
	[CD_DEP_COLLEGE_COUNT] [bigint] NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (CD_DEMO_SK)
);

CREATE TABLE tpcds10t.[DATE_DIM]
(
	[D_DATE_SK] [bigint] NOT NULL,
	[D_DATE_ID] [varchar](16) NOT NULL,
	[D_DATE] [date] NULL,
	[D_MONTH_SEQ] [bigint] NULL,
	[D_WEEK_SEQ] [bigint] NULL,
	[D_QUARTER_SEQ] [bigint] NULL,
	[D_YEAR] [bigint] NULL,
	[D_DOW] [bigint] NULL,
	[D_MOY] [bigint] NULL,
	[D_DOM] [bigint] NULL,
	[D_QOY] [bigint] NULL,
	[D_FY_YEAR] [bigint] NULL,
	[D_FY_QUARTER_SEQ] [bigint] NULL,
	[D_FY_WEEK_SEQ] [bigint] NULL,
	[D_DAY_NAME] [varchar](9) NULL,
	[D_QUARTER_NAME] [varchar](6) NULL,
	[D_HOLIDAY] [varchar](1) NULL,
	[D_WEEKEND] [varchar](1) NULL,
	[D_FOLLOWING_HOLIDAY] [varchar](1) NULL,
	[D_FIRST_DOM] [bigint] NULL,
	[D_LAST_DOM] [bigint] NULL,
	[D_SAME_DAY_LY] [bigint] NULL,
	[D_SAME_DAY_LQ] [bigint] NULL,
	[D_CURRENT_DAY] [varchar](1) NULL,
	[D_CURRENT_WEEK] [varchar](1) NULL,
	[D_CURRENT_MONTH] [varchar](1) NULL,
	[D_CURRENT_QUARTER] [varchar](1) NULL,
	[D_CURRENT_YEAR] [varchar](1) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (D_DATE_SK)
);

CREATE TABLE tpcds10t.[DBGEN_VERSION]
(
	[DV_VERSION] [varchar](16) NULL,
	[DV_CREATE_DATE] [date] NULL,
	[DV_CREATE_TIME] [varchar](10) NULL,
	[DV_CMDLINE_ARGS] [varchar](200) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX
);

CREATE TABLE tpcds10t.[HOUSEHOLD_DEMOGRAPHICS]
(
	[HD_DEMO_SK] [bigint] NOT NULL,
	[HD_INCOME_BAND_SK] [bigint] NULL,
	[HD_BUY_POTENTIAL] [varchar](15) NULL,
	[HD_DEP_COUNT] [bigint] NULL,
	[HD_VEHICLE_COUNT] [bigint] NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (HD_DEMO_SK)
);

CREATE TABLE tpcds10t.[INCOME_BAND]
(
	[IB_INCOME_BAND_SK] [bigint] NOT NULL,
	[IB_LOWER_BOUND] [bigint] NULL,
	[IB_UPPER_BOUND] [bigint] NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (IB_INCOME_BAND_SK)
);

CREATE TABLE tpcds10t.[INVENTORY]
(
	[INV_DATE_SK] [bigint] NOT NULL,
	[INV_ITEM_SK] [bigint] NOT NULL,
	[INV_WAREHOUSE_SK] [bigint] NOT NULL,
	[INV_QUANTITY_ON_HAND] [bigint] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX ORDER (INV_DATE_SK, INV_ITEM_SK)
);

CREATE TABLE tpcds10t.[ITEM]
(
	[I_ITEM_SK] [int] NULL,
	[I_ITEM_ID] [varchar](16) NULL,
	[I_REC_START_DATE] [date] NULL,
	[I_REC_END_DATE] [date] NULL,
	[I_ITEM_DESC] [varchar](200) NULL,
	[I_CURRENT_PRICE] [decimal](7, 2) NULL,
	[I_WHOLESALE_COST] [decimal](7, 2) NULL,
	[I_BRAND_ID] [int] NULL,
	[I_BRAND] [varchar](50) NULL,
	[I_CLASS_ID] [int] NULL,
	[I_CLASS] [varchar](50) NULL,
	[I_CATEGORY_ID] [int] NULL,
	[I_CATEGORY] [varchar](50) NULL,
	[I_MANUFACT_ID] [int] NULL,
	[I_MANUFACT] [varchar](50) NULL,
	[I_SIZE] [varchar](20) NULL,
	[I_FORMULATION] [varchar](20) NULL,
	[I_COLOR] [varchar](20) NULL,
	[I_UNITS] [varchar](10) NULL,
	[I_CONTAINER] [varchar](10) NULL,
	[I_MANAGER_ID] [int] NULL,
	[I_PRODUCT_NAME] [varchar](50) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (I_ITEM_SK)
);

CREATE TABLE tpcds10t.[PROMOTION]
(
	[P_PROMO_SK] [bigint] NOT NULL,
	[P_PROMO_ID] [varchar](16) NOT NULL,
	[P_START_DATE_SK] [bigint] NULL,
	[P_END_DATE_SK] [bigint] NULL,
	[P_ITEM_SK] [bigint] NULL,
	[P_COST] [decimal](15, 2) NULL,
	[P_RESPONSE_TARGET] [bigint] NULL,
	[P_PROMO_NAME] [varchar](50) NULL,
	[P_CHANNEL_DMAIL] [varchar](1) NULL,
	[P_CHANNEL_EMAIL] [varchar](1) NULL,
	[P_CHANNEL_CATALOG] [varchar](1) NULL,
	[P_CHANNEL_TV] [varchar](1) NULL,
	[P_CHANNEL_RADIO] [varchar](1) NULL,
	[P_CHANNEL_PRESS] [varchar](1) NULL,
	[P_CHANNEL_EVENT] [varchar](1) NULL,
	[P_CHANNEL_DEMO] [varchar](1) NULL,
	[P_CHANNEL_DETAILS] [varchar](100) NULL,
	[P_PURPOSE] [varchar](15) NULL,
	[P_DISCOUNT_ACTIVE] [varchar](1) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (P_PROMO_SK)
);

CREATE TABLE tpcds10t.[REASON]
(
	[R_REASON_SK] [bigint] NOT NULL,
	[R_REASON_ID] [varchar](16) NOT NULL,
	[R_REASON_DESC] [varchar](100) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (R_REASON_SK)
);

CREATE TABLE tpcds10t.[SHIP_MODE]
(
	[SM_SHIP_MODE_SK] [bigint] NOT NULL,
	[SM_SHIP_MODE_ID] [varchar](16) NOT NULL,
	[SM_TYPE] [varchar](30) NULL,
	[SM_CODE] [varchar](10) NULL,
	[SM_CARRIER] [varchar](20) NULL,
	[SM_CONTRACT] [varchar](20) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (SM_SHIP_MODE_SK)
);

CREATE TABLE tpcds10t.[STORE]
(
	[S_STORE_SK] [bigint] NOT NULL,
	[S_STORE_ID] [varchar](16) NOT NULL,
	[S_REC_START_DATE] [date] NULL,
	[S_REC_END_DATE] [date] NULL,
	[S_CLOSED_DATE_SK] [bigint] NULL,
	[S_STORE_NAME] [varchar](50) NULL,
	[S_NUMBER_EMPLOYEES] [bigint] NULL,
	[S_FLOOR_SPACE] [bigint] NULL,
	[S_HOURS] [varchar](20) NULL,
	[S_MANAGER] [varchar](40) NULL,
	[S_MARKET_ID] [bigint] NULL,
	[S_GEOGRAPHY_CLASS] [varchar](100) NULL,
	[S_MARKET_DESC] [varchar](100) NULL,
	[S_MARKET_MANAGER] [varchar](40) NULL,
	[S_DIVISION_ID] [bigint] NULL,
	[S_DIVISION_NAME] [varchar](50) NULL,
	[S_COMPANY_ID] [bigint] NULL,
	[S_COMPANY_NAME] [varchar](50) NULL,
	[S_STREET_NUMBER] [varchar](10) NULL,
	[S_STREET_NAME] [varchar](60) NULL,
	[S_STREET_TYPE] [varchar](15) NULL,
	[S_SUITE_NUMBER] [varchar](10) NULL,
	[S_CITY] [varchar](60) NULL,
	[S_COUNTY] [varchar](30) NULL,
	[S_STATE] [varchar](2) NULL,
	[S_ZIP] [varchar](10) NULL,
	[S_COUNTRY] [varchar](20) NULL,
	[S_GMT_OFFSET] [decimal](5, 2) NULL,
	[S_TAX_PRECENTAGE] [decimal](5, 2) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (S_STORE_SK)
);

CREATE TABLE tpcds10t.[STORE_RETURNS]
(
	[SR_RETURNED_DATE_SK] [bigint] NULL,
	[SR_RETURN_TIME_SK] [bigint] NULL,
	[SR_ITEM_SK] [bigint] NOT NULL,
	[SR_CUSTOMER_SK] [bigint] NULL,
	[SR_CDEMO_SK] [bigint] NULL,
	[SR_HDEMO_SK] [bigint] NULL,
	[SR_ADDR_SK] [bigint] NULL,
	[SR_STORE_SK] [bigint] NULL,
	[SR_REASON_SK] [bigint] NULL,
	[SR_TICKET_NUMBER] [bigint] NOT NULL,
	[SR_RETURN_QUANTITY] [bigint] NULL,
	[SR_RETURN_AMT] [decimal](7, 2) NULL,
	[SR_RETURN_TAX] [decimal](7, 2) NULL,
	[SR_RETURN_AMT_INC_TAX] [decimal](7, 2) NULL,
	[SR_FEE] [decimal](7, 2) NULL,
	[SR_RETURN_SHIP_COST] [decimal](7, 2) NULL,
	[SR_REFUNDED_CASH] [decimal](7, 2) NULL,
	[SR_REVERSED_CHARGE] [decimal](7, 2) NULL,
	[SR_STORE_CREDIT] [decimal](7, 2) NULL,
	[SR_NET_LOSS] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX ORDER (SR_RETURNED_DATE_SK, SR_ITEM_SK)
);

CREATE TABLE tpcds10t.[STORE_SALES]
(
	[SS_SOLD_DATE_SK] [bigint] NULL,
	[SS_SOLD_TIME_SK] [bigint] NULL,
	[SS_ITEM_SK] [bigint] NOT NULL,
	[SS_CUSTOMER_SK] [bigint] NULL,
	[SS_CDEMO_SK] [bigint] NULL,
	[SS_HDEMO_SK] [bigint] NULL,
	[SS_ADDR_SK] [bigint] NULL,
	[SS_STORE_SK] [bigint] NULL,
	[SS_PROMO_SK] [bigint] NULL,
	[SS_TICKET_NUMBER] [bigint] NOT NULL,
	[SS_QUANTITY] [bigint] NULL,
	[SS_WHOLESALE_COST] [decimal](7, 2) NULL,
	[SS_LIST_PRICE] [decimal](7, 2) NULL,
	[SS_SALES_PRICE] [decimal](7, 2) NULL,
	[SS_EXT_DISCOUNT_AMT] [decimal](7, 2) NULL,
	[SS_EXT_SALES_PRICE] [decimal](7, 2) NULL,
	[SS_EXT_WHOLESALE_COST] [decimal](7, 2) NULL,
	[SS_EXT_LIST_PRICE] [decimal](7, 2) NULL,
	[SS_EXT_TAX] [decimal](7, 2) NULL,
	[SS_COUPON_AMT] [decimal](7, 2) NULL,
	[SS_NET_PAID] [decimal](7, 2) NULL,
	[SS_NET_PAID_INC_TAX] [decimal](7, 2) NULL,
	[SS_NET_PROFIT] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH(SS_ITEM_SK),
	CLUSTERED COLUMNSTORE INDEX ORDER (SS_SOLD_DATE_SK, SS_ITEM_SK)
);

CREATE TABLE tpcds10t.[TIME_DIM]
(
	[T_TIME_SK] [bigint] NOT NULL,
	[T_TIME_ID] [varchar](16) NOT NULL,
	[T_TIME] [bigint] NULL,
	[T_HOUR] [bigint] NULL,
	[T_MINUTE] [bigint] NULL,
	[T_SECOND] [bigint] NULL,
	[T_AM_PM] [varchar](2) NULL,
	[T_SHIFT] [varchar](20) NULL,
	[T_SUB_SHIFT] [varchar](20) NULL,
	[T_MEAL_TIME] [varchar](20) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (T_TIME_SK)
);

CREATE TABLE tpcds10t.[WAREHOUSE]
(
	[W_WAREHOUSE_SK] [bigint] NOT NULL,
	[W_WAREHOUSE_ID] [varchar](16) NOT NULL,
	[W_WAREHOUSE_NAME] [varchar](20) NULL,
	[W_WAREHOUSE_SQ_FT] [bigint] NULL,
	[W_STREET_NUMBER] [varchar](10) NULL,
	[W_STREET_NAME] [varchar](60) NULL,
	[W_STREET_TYPE] [varchar](15) NULL,
	[W_SUITE_NUMBER] [varchar](10) NULL,
	[W_CITY] [varchar](60) NULL,
	[W_COUNTY] [varchar](30) NULL,
	[W_STATE] [varchar](2) NULL,
	[W_ZIP] [varchar](10) NULL,
	[W_COUNTRY] [varchar](20) NULL,
	[W_GMT_OFFSET] [decimal](5, 2) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (W_WAREHOUSE_SK)
);

CREATE TABLE tpcds10t.[WEB_PAGE]
(
	[WP_WEB_PAGE_SK] [bigint] NOT NULL,
	[WP_WEB_PAGE_ID] [varchar](16) NOT NULL,
	[WP_REC_START_DATE] [date] NULL,
	[WP_REC_END_DATE] [date] NULL,
	[WP_CREATION_DATE_SK] [bigint] NULL,
	[WP_ACCESS_DATE_SK] [bigint] NULL,
	[WP_AUTOGEN_FLAG] [varchar](1) NULL,
	[WP_CUSTOMER_SK] [bigint] NULL,
	[WP_URL] [varchar](100) NULL,
	[WP_TYPE] [varchar](50) NULL,
	[WP_CHAR_COUNT] [bigint] NULL,
	[WP_LINK_COUNT] [bigint] NULL,
	[WP_IMAGE_COUNT] [bigint] NULL,
	[WP_MAX_AD_COUNT] [bigint] NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (WP_WEB_PAGE_SK)
);

CREATE TABLE tpcds10t.[WEB_RETURNS]
(
	[WR_RETURNED_DATE_SK] [bigint] NULL,
	[WR_RETURNED_TIME_SK] [bigint] NULL,
	[WR_ITEM_SK] [bigint] NOT NULL,
	[WR_REFUNDED_CUSTOMER_SK] [bigint] NULL,
	[WR_REFUNDED_CDEMO_SK] [bigint] NULL,
	[WR_REFUNDED_HDEMO_SK] [bigint] NULL,
	[WR_REFUNDED_ADDR_SK] [bigint] NULL,
	[WR_RETURNING_CUSTOMER_SK] [bigint] NULL,
	[WR_RETURNING_CDEMO_SK] [bigint] NULL,
	[WR_RETURNING_HDEMO_SK] [bigint] NULL,
	[WR_RETURNING_ADDR_SK] [bigint] NULL,
	[WR_WEB_PAGE_SK] [bigint] NULL,
	[WR_REASON_SK] [bigint] NULL,
	[WR_ORDER_NUMBER] [bigint] NOT NULL,
	[WR_RETURN_QUANTITY] [bigint] NULL,
	[WR_RETURN_AMT] [decimal](7, 2) NULL,
	[WR_RETURN_TAX] [decimal](7, 2) NULL,
	[WR_RETURN_AMT_INC_TAX] [decimal](7, 2) NULL,
	[WR_FEE] [decimal](7, 2) NULL,
	[WR_RETURN_SHIP_COST] [decimal](7, 2) NULL,
	[WR_REFUNDED_CASH] [decimal](7, 2) NULL,
	[WR_REVERSED_CHARGE] [decimal](7, 2) NULL,
	[WR_ACCOUNT_CREDIT] [decimal](7, 2) NULL,
	[WR_NET_LOSS] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX ORDER (WR_RETURNED_DATE_SK, WR_ITEM_SK)
);

CREATE TABLE tpcds10t.[WEB_SALES]
(
	[WS_SOLD_DATE_SK] [bigint] NULL,
	[WS_SOLD_TIME_SK] [bigint] NULL,
	[WS_SHIP_DATE_SK] [bigint] NULL,
	[WS_ITEM_SK] [bigint] NOT NULL,
	[WS_BILL_CUSTOMER_SK] [bigint] NULL,
	[WS_BILL_CDEMO_SK] [bigint] NULL,
	[WS_BILL_HDEMO_SK] [bigint] NULL,
	[WS_BILL_ADDR_SK] [bigint] NULL,
	[WS_SHIP_CUSTOMER_SK] [bigint] NULL,
	[WS_SHIP_CDEMO_SK] [bigint] NULL,
	[WS_SHIP_HDEMO_SK] [bigint] NULL,
	[WS_SHIP_ADDR_SK] [bigint] NULL,
	[WS_WEB_PAGE_SK] [bigint] NULL,
	[WS_WEB_SITE_SK] [bigint] NULL,
	[WS_SHIP_MODE_SK] [bigint] NULL,
	[WS_WAREHOUSE_SK] [bigint] NULL,
	[WS_PROMO_SK] [bigint] NULL,
	[WS_ORDER_NUMBER] [bigint] NOT NULL,
	[WS_QUANTITY] [bigint] NULL,
	[WS_WHOLESALE_COST] [decimal](7, 2) NULL,
	[WS_LIST_PRICE] [decimal](7, 2) NULL,
	[WS_SALES_PRICE] [decimal](7, 2) NULL,
	[WS_EXT_DISCOUNT_AMT] [decimal](7, 2) NULL,
	[WS_EXT_SALES_PRICE] [decimal](7, 2) NULL,
	[WS_EXT_WHOLESALE_COST] [decimal](7, 2) NULL,
	[WS_EXT_LIST_PRICE] [decimal](7, 2) NULL,
	[WS_EXT_TAX] [decimal](7, 2) NULL,
	[WS_COUPON_AMT] [decimal](7, 2) NULL,
	[WS_EXT_SHIP_COST] [decimal](7, 2) NULL,
	[WS_NET_PAID] [decimal](7, 2) NULL,
	[WS_NET_PAID_INC_TAX] [decimal](7, 2) NULL,
	[WS_NET_PAID_INC_SHIP] [decimal](7, 2) NULL,
	[WS_NET_PAID_INC_SHIP_TAX] [decimal](7, 2) NULL,
	[WS_NET_PROFIT] [decimal](7, 2) NULL
)
WITH
(
	DISTRIBUTION = HASH(WS_ITEM_SK),
	CLUSTERED COLUMNSTORE INDEX ORDER (WS_SOLD_DATE_SK, WS_ITEM_SK)
);

CREATE TABLE tpcds10t.[WEB_SITE]
(
	[WEB_SITE_SK] [bigint] NOT NULL,
	[WEB_SITE_ID] [varchar](16) NOT NULL,
	[WEB_REC_START_DATE] [date] NULL,
	[WEB_REC_END_DATE] [date] NULL,
	[WEB_NAME] [varchar](50) NULL,
	[WEB_OPEN_DATE_SK] [bigint] NULL,
	[WEB_CLOSE_DATE_SK] [bigint] NULL,
	[WEB_CLASS] [varchar](50) NULL,
	[WEB_MANAGER] [varchar](40) NULL,
	[WEB_MKT_ID] [bigint] NULL,
	[WEB_MKT_CLASS] [varchar](50) NULL,
	[WEB_MKT_DESC] [varchar](100) NULL,
	[WEB_MARKET_MANAGER] [varchar](40) NULL,
	[WEB_COMPANY_ID] [bigint] NULL,
	[WEB_COMPANY_NAME] [varchar](50) NULL,
	[WEB_STREET_NUMBER] [varchar](10) NULL,
	[WEB_STREET_NAME] [varchar](60) NULL,
	[WEB_STREET_TYPE] [varchar](15) NULL,
	[WEB_SUITE_NUMBER] [varchar](10) NULL,
	[WEB_CITY] [varchar](60) NULL,
	[WEB_COUNTY] [varchar](30) NULL,
	[WEB_STATE] [varchar](2) NULL,
	[WEB_ZIP] [varchar](10) NULL,
	[WEB_COUNTRY] [varchar](20) NULL,
	[WEB_GMT_OFFSET] [decimal](5, 2) NULL,
	[WEB_TAX_PERCENTAGE] [decimal](5, 2) NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED COLUMNSTORE INDEX ORDER (WEB_SITE_SK)
);
