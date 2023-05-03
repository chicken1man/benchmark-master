CREATE TABLE `benchmark-251817.TPCDS_10TB.call_center`
(
  cc_call_center_sk INT64,
  cc_call_center_id STRING,
  cc_rec_start_date DATE,
  cc_rec_end_date DATE,
  cc_closed_date_sk INT64,
  cc_open_date_sk INT64,
  cc_name STRING,
  cc_class STRING,
  cc_employees INT64,
  cc_sq_ft INT64,
  cc_hours STRING,
  cc_manager STRING,
  cc_mkt_id INT64,
  cc_mkt_class STRING,
  cc_mkt_desc STRING,
  cc_market_manager STRING,
  cc_division INT64,
  cc_division_name STRING,
  cc_company INT64,
  cc_company_name STRING,
  cc_street_number STRING,
  cc_street_name STRING,
  cc_street_type STRING,
  cc_suite_number STRING,
  cc_city STRING,
  cc_county STRING,
  cc_state STRING,
  cc_zip STRING,
  cc_country STRING,
  cc_gmt_offset NUMERIC,
  cc_tax_percentage NUMERIC
)
CLUSTER BY CC_CALL_CENTER_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.catalog_page`
(
  cp_catalog_page_sk INT64,
  cp_catalog_page_id STRING,
  cp_start_date_sk INT64,
  cp_end_date_sk INT64,
  cp_department STRING,
  cp_catalog_number INT64,
  cp_catalog_page_number INT64,
  cp_description STRING,
  cp_type STRING
)
CLUSTER BY CP_CATALOG_PAGE_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.catalog_returns`
(
  cr_returned_date_sk INT64,
  cr_returned_time_sk INT64,
  cr_item_sk INT64,
  cr_refunded_customer_sk INT64,
  cr_refunded_cdemo_sk INT64,
  cr_refunded_hdemo_sk INT64,
  cr_refunded_addr_sk INT64,
  cr_returning_customer_sk INT64,
  cr_returning_cdemo_sk INT64,
  cr_returning_hdemo_sk INT64,
  cr_returning_addr_sk INT64,
  cr_call_center_sk INT64,
  cr_catalog_page_sk INT64,
  cr_ship_mode_sk INT64,
  cr_warehouse_sk INT64,
  cr_reason_sk INT64,
  cr_order_number INT64,
  cr_return_quantity INT64,
  cr_return_amount NUMERIC,
  cr_return_tax NUMERIC,
  cr_return_amt_inc_tax NUMERIC,
  cr_fee NUMERIC,
  cr_return_ship_cost NUMERIC,
  cr_refunded_cash NUMERIC,
  cr_reversed_charge NUMERIC,
  cr_store_credit NUMERIC,
  cr_net_loss NUMERIC
)
CLUSTER BY CR_RETURNED_DATE_SK, CR_ITEM_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.catalog_sales`
(
  cs_sold_date_sk INT64,
  cs_sold_time_sk INT64,
  cs_ship_date_sk INT64,
  cs_bill_customer_sk INT64,
  cs_bill_cdemo_sk INT64,
  cs_bill_hdemo_sk INT64,
  cs_bill_addr_sk INT64,
  cs_ship_customer_sk INT64,
  cs_ship_cdemo_sk INT64,
  cs_ship_hdemo_sk INT64,
  cs_ship_addr_sk INT64,
  cs_call_center_sk INT64,
  cs_catalog_page_sk INT64,
  cs_ship_mode_sk INT64,
  cs_warehouse_sk INT64,
  cs_item_sk INT64,
  cs_promo_sk INT64,
  cs_order_number INT64,
  cs_quantity INT64,
  cs_wholesale_cost NUMERIC,
  cs_list_price NUMERIC,
  cs_sales_price NUMERIC,
  cs_ext_discount_amt NUMERIC,
  cs_ext_sales_price NUMERIC,
  cs_ext_wholesale_cost NUMERIC,
  cs_ext_list_price NUMERIC,
  cs_ext_tax NUMERIC,
  cs_coupon_amt NUMERIC,
  cs_ext_ship_cost NUMERIC,
  cs_net_paid NUMERIC,
  cs_net_paid_inc_tax NUMERIC,
  cs_net_paid_inc_ship NUMERIC,
  cs_net_paid_inc_ship_tax NUMERIC,
  cs_net_profit NUMERIC
)
CLUSTER BY CS_SOLD_DATE_SK, CS_ITEM_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.customer`
(
  c_customer_sk INT64,
  c_customer_id STRING,
  c_current_cdemo_sk INT64,
  c_current_hdemo_sk INT64,
  c_current_addr_sk INT64,
  c_first_shipto_date_sk INT64,
  c_first_sales_date_sk INT64,
  c_salutation STRING,
  c_first_name STRING,
  c_last_name STRING,
  c_preferred_cust_flag STRING,
  c_birth_day INT64,
  c_birth_month INT64,
  c_birth_year INT64,
  c_birth_country STRING,
  c_login STRING,
  c_email_address STRING,
  c_last_review_date STRING
)
CLUSTER BY C_CUSTOMER_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.customer_address`
(
  ca_address_sk INT64,
  ca_address_id STRING,
  ca_street_number STRING,
  ca_street_name STRING,
  ca_street_type STRING,
  ca_suite_number STRING,
  ca_city STRING,
  ca_county STRING,
  ca_state STRING,
  ca_zip STRING,
  ca_country STRING,
  ca_gmt_offset NUMERIC,
  ca_location_type STRING
)
CLUSTER BY CA_ADDRESS_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.customer_demographics`
(
  cd_demo_sk INT64,
  cd_gender STRING,
  cd_marital_status STRING,
  cd_education_status STRING,
  cd_purchase_estimate INT64,
  cd_credit_rating STRING,
  cd_dep_count INT64,
  cd_dep_employed_count INT64,
  cd_dep_college_count INT64
)
CLUSTER BY CD_DEMO_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.date_dim`
(
  d_date_sk INT64,
  d_date_id STRING,
  d_date DATE,
  d_month_seq INT64,
  d_week_seq INT64,
  d_quarter_seq INT64,
  d_year INT64,
  d_dow INT64,
  d_moy INT64,
  d_dom INT64,
  d_qoy INT64,
  d_fy_year INT64,
  d_fy_quarter_seq INT64,
  d_fy_week_seq INT64,
  d_day_name STRING,
  d_quarter_name STRING,
  d_holiday STRING,
  d_weekend STRING,
  d_following_holiday STRING,
  d_first_dom INT64,
  d_last_dom INT64,
  d_same_day_ly INT64,
  d_same_day_lq INT64,
  d_current_day STRING,
  d_current_week STRING,
  d_current_month STRING,
  d_current_quarter STRING,
  d_current_year STRING
)
CLUSTER BY D_DATE_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.household_demographics`
(
  hd_demo_sk INT64,
  hd_income_band_sk INT64,
  hd_buy_potential STRING,
  hd_dep_count INT64,
  hd_vehicle_count INT64
)
CLUSTER BY HD_DEMO_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.income_band`
(
  ib_income_band_sk INT64,
  ib_lower_bound INT64,
  ib_upper_bound INT64
)
CLUSTER BY IB_INCOME_BAND_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.inventory`
(
  inv_date_sk INT64,
  inv_item_sk INT64,
  inv_warehouse_sk INT64,
  inv_quantity_on_hand INT64
)
CLUSTER BY INV_DATE_SK, INV_ITEM_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.item`
(
  i_item_sk INT64,
  i_item_id STRING,
  i_rec_start_date DATE,
  i_rec_end_date DATE,
  i_item_desc STRING,
  i_current_price NUMERIC,
  i_wholesale_cost NUMERIC,
  i_brand_id INT64,
  i_brand STRING,
  i_class_id INT64,
  i_class STRING,
  i_category_id INT64,
  i_category STRING,
  i_manufact_id INT64,
  i_manufact STRING,
  i_size STRING,
  i_formulation STRING,
  i_color STRING,
  i_units STRING,
  i_container STRING,
  i_manager_id INT64,
  i_product_name STRING
)
CLUSTER BY I_ITEM_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.promotion`
(
  p_promo_sk INT64,
  p_promo_id STRING,
  p_start_date_sk INT64,
  p_end_date_sk INT64,
  p_item_sk INT64,
  p_cost NUMERIC,
  p_response_target INT64,
  p_promo_name STRING,
  p_channel_dmail STRING,
  p_channel_email STRING,
  p_channel_catalog STRING,
  p_channel_tv STRING,
  p_channel_radio STRING,
  p_channel_press STRING,
  p_channel_event STRING,
  p_channel_demo STRING,
  p_channel_details STRING,
  p_purpose STRING,
  p_discount_active STRING
)
CLUSTER BY P_PROMO_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.reason`
(
  r_reason_sk INT64,
  r_reason_id STRING,
  r_reason_desc STRING
)
CLUSTER BY R_REASON_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.ship_mode`
(
  sm_ship_mode_sk INT64,
  sm_ship_mode_id STRING,
  sm_type STRING,
  sm_code STRING,
  sm_carrier STRING,
  sm_contract STRING
)
CLUSTER BY SM_SHIP_MODE_SK;

CREATE `benchmark-251817.TPCDS_10TB.store`
(
  s_store_sk INT64,
  s_store_id STRING,
  s_rec_start_date DATE,
  s_rec_end_date DATE,
  s_closed_date_sk INT64,
  s_store_name STRING,
  s_number_employees INT64,
  s_floor_space INT64,
  s_hours STRING,
  s_manager STRING,
  s_market_id INT64,
  s_geography_class STRING,
  s_market_desc STRING,
  s_market_manager STRING,
  s_division_id INT64,
  s_division_name STRING,
  s_company_id INT64,
  s_company_name STRING,
  s_street_number STRING,
  s_street_name STRING,
  s_street_type STRING,
  s_suite_number STRING,
  s_city STRING,
  s_county STRING,
  s_state STRING,
  s_zip STRING,
  s_country STRING,
  s_gmt_offset NUMERIC,
  s_tax_precentage NUMERIC
)
CLUSTER BY S_STORE_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.store_returns`
(
  sr_returned_date_sk INT64,
  sr_return_time_sk INT64,
  sr_item_sk INT64,
  sr_customer_sk INT64,
  sr_cdemo_sk INT64,
  sr_hdemo_sk INT64,
  sr_addr_sk INT64,
  sr_store_sk INT64,
  sr_reason_sk INT64,
  sr_ticket_number INT64,
  sr_return_quantity INT64,
  sr_return_amt NUMERIC,
  sr_return_tax NUMERIC,
  sr_return_amt_inc_tax NUMERIC,
  sr_fee NUMERIC,
  sr_return_ship_cost NUMERIC,
  sr_refunded_cash NUMERIC,
  sr_reversed_charge NUMERIC,
  sr_store_credit NUMERIC,
  sr_net_loss NUMERIC
)
CLUSTER BY SR_RETURNED_DATE_SK, SR_ITEM_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.store_sales`
(
  ss_sold_date_sk INT64,
  ss_sold_time_sk INT64,
  ss_item_sk INT64,
  ss_customer_sk INT64,
  ss_cdemo_sk INT64,
  ss_hdemo_sk INT64,
  ss_addr_sk INT64,
  ss_store_sk INT64,
  ss_promo_sk INT64,
  ss_ticket_number INT64,
  ss_quantity INT64,
  ss_wholesale_cost NUMERIC,
  ss_list_price NUMERIC,
  ss_sales_price NUMERIC,
  ss_ext_discount_amt NUMERIC,
  ss_ext_sales_price NUMERIC,
  ss_ext_wholesale_cost NUMERIC,
  ss_ext_list_price NUMERIC,
  ss_ext_tax NUMERIC,
  ss_coupon_amt NUMERIC,
  ss_net_paid NUMERIC,
  ss_net_paid_inc_tax NUMERIC,
  ss_net_profit NUMERIC
)
CLUSTER BY SS_SOLD_DATE_SK, SS_ITEM_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.time_dim`
(
  t_time_sk INT64,
  t_time_id STRING,
  t_time INT64,
  t_hour INT64,
  t_minute INT64,
  t_second INT64,
  t_am_pm STRING,
  t_shift STRING,
  t_sub_shift STRING,
  t_meal_time STRING
)
CLUSTER BY T_TIME_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.warehouse`
(
  w_warehouse_sk INT64,
  w_warehouse_id STRING,
  w_warehouse_name STRING,
  w_warehouse_sq_ft INT64,
  w_street_number STRING,
  w_street_name STRING,
  w_street_type STRING,
  w_suite_number STRING,
  w_city STRING,
  w_county STRING,
  w_state STRING,
  w_zip STRING,
  w_country STRING,
  w_gmt_offset NUMERIC
)
CLUSTER BY W_WAREHOUSE_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.web_page`
(
  wp_web_page_sk INT64,
  wp_web_page_id STRING,
  wp_rec_start_date DATE,
  wp_rec_end_date DATE,
  wp_creation_date_sk INT64,
  wp_access_date_sk INT64,
  wp_autogen_flag STRING,
  wp_customer_sk INT64,
  wp_url STRING,
  wp_type STRING,
  wp_char_count INT64,
  wp_link_count INT64,
  wp_image_count INT64,
  wp_max_ad_count INT64
)
CLUSTER BY WP_WEB_PAGE_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.web_returns`
(
  wr_returned_date_sk INT64,
  wr_returned_time_sk INT64,
  wr_item_sk INT64,
  wr_refunded_customer_sk INT64,
  wr_refunded_cdemo_sk INT64,
  wr_refunded_hdemo_sk INT64,
  wr_refunded_addr_sk INT64,
  wr_returning_customer_sk INT64,
  wr_returning_cdemo_sk INT64,
  wr_returning_hdemo_sk INT64,
  wr_returning_addr_sk INT64,
  wr_web_page_sk INT64,
  wr_reason_sk INT64,
  wr_order_number INT64,
  wr_return_quantity INT64,
  wr_return_amt NUMERIC,
  wr_return_tax NUMERIC,
  wr_return_amt_inc_tax NUMERIC,
  wr_fee NUMERIC,
  wr_return_ship_cost NUMERIC,
  wr_refunded_cash NUMERIC,
  wr_reversed_charge NUMERIC,
  wr_account_credit NUMERIC,
  wr_net_loss NUMERIC
)
CLUSTER BY WR_RETURNED_DATE_SK, WR_ITEM_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.web_sales`
(
  ws_sold_date_sk INT64,
  ws_sold_time_sk INT64,
  ws_ship_date_sk INT64,
  ws_item_sk INT64,
  ws_bill_customer_sk INT64,
  ws_bill_cdemo_sk INT64,
  ws_bill_hdemo_sk INT64,
  ws_bill_addr_sk INT64,
  ws_ship_customer_sk INT64,
  ws_ship_cdemo_sk INT64,
  ws_ship_hdemo_sk INT64,
  ws_ship_addr_sk INT64,
  ws_web_page_sk INT64,
  ws_web_site_sk INT64,
  ws_ship_mode_sk INT64,
  ws_warehouse_sk INT64,
  ws_promo_sk INT64,
  ws_order_number INT64,
  ws_quantity INT64,
  ws_wholesale_cost NUMERIC,
  ws_list_price NUMERIC,
  ws_sales_price NUMERIC,
  ws_ext_discount_amt NUMERIC,
  ws_ext_sales_price NUMERIC,
  ws_ext_wholesale_cost NUMERIC,
  ws_ext_list_price NUMERIC,
  ws_ext_tax NUMERIC,
  ws_coupon_amt NUMERIC,
  ws_ext_ship_cost NUMERIC,
  ws_net_paid NUMERIC,
  ws_net_paid_inc_tax NUMERIC,
  ws_net_paid_inc_ship NUMERIC,
  ws_net_paid_inc_ship_tax NUMERIC,
  ws_net_profit NUMERIC
)
CLUSTER BY
WS_SOLD_DATE_SK, WS_ITEM_SK;

CREATE TABLE `benchmark-251817.TPCDS_10TB.web_site`
(
  web_site_sk INT64,
  web_site_id STRING,
  web_rec_start_date DATE,
  web_rec_end_date DATE,
  web_name STRING,
  web_open_date_sk INT64,
  web_close_date_sk INT64,
  web_class STRING,
  web_manager STRING,
  web_mkt_id INT64,
  web_mkt_class STRING,
  web_mkt_desc STRING,
  web_market_manager STRING,
  web_company_id INT64,
  web_company_name STRING,
  web_street_number STRING,
  web_street_name STRING,
  web_street_type STRING,
  web_suite_number STRING,
  web_city STRING,
  web_county STRING,
  web_state STRING,
  web_zip STRING,
  web_country STRING,
  web_gmt_offset NUMERIC,
  web_tax_percentage NUMERIC
)
CLUSTER BY WEB_SITE_SK;
