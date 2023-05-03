 -- TPC-DS_query 2
SELECT
  `Sold Calendar Week` AS `sold_calendar_week`,
  `Sold d_day_name_week` AS `sold_d_day_name_week`,
  `Sold d_week_seg` AS `sold_d_week_seg`,
  SUM(
    `Web Catalog Sales Price Growth`
  ) AS `sum_web_catalog_sales_price_growth_ok`
FROM
  `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
  (
    `Sold Calendar Year-Week` IN (2000, 2001)
  )
GROUP BY
  1,
  2,
  3;

 -- TPC-DS_query 7
SELECT
    `tpc_ds_benchmark_model`.`d_product_item_id`         AS `d_product_item_id`,
    AVG(`tpc_ds_benchmark_model`.`m_SS_QUANTITY_avg`)    AS `avg_m_ss_quantity_avg_ok`,
    AVG(`tpc_ds_benchmark_model`.`m_ss_list_price_avg`)  AS `avg_m_ss_list_price_avg_ok`,
    AVG(`tpc_ds_benchmark_model`.`m_ss_coupon_amt_avg`)  AS `avg_m_ss_coupon_amt_avg_ok`,
    AVG(`tpc_ds_benchmark_model`.`m_ss_sales_price_avg`) AS `avg_m_ss_sales_price_avg_ok`
FROM
    `tpc-ds benchmark model` `tpc_ds_benchmark_model`
WHERE
    (
        `tpc_ds_benchmark_model`.`d_channel_email` = 'N'
    OR  `tpc_ds_benchmark_model`.`d_channel_event` = 'N')
AND `tpc_ds_benchmark_model`.`Sold Calendar Year` = 2001
AND `tpc_ds_benchmark_model`.`d_cd_education_status` = '4 yr Degree'
AND `tpc_ds_benchmark_model`.`d_cd_gender` = 'M'
AND `tpc_ds_benchmark_model`.`d_cd_marital_status` = 'M'
GROUP BY
    1
ORDER BY
    1 
LIMIT 100;

 -- TPC-DS_query 13
SELECT
    SUM(`m_SS_QUANTITY_avg`)          AS `sum_m_ss_quantity_avg_ok`,
    SUM( `m_SS_EXT_SALES_PRICE_avg` ) AS `sum_m_ss_ext_sales_price_avg_ok`
    ,
    SUM( `m_SS_EXT_WHOLESALE_COST_avg` ) AS
    `sum_m_ss_ext_wholesale_cost_avg_ok`,
    SUM( `m_ss_ext_wholesale_cost_sum` ) AS
    `sum_m_ss_ext_wholesale_cost_sum_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    `Sold Calendar Year-Week` = 2001
AND ( (
            `d_cd_education_status` = '4 yr Degree'
        AND `d_cd_marital_status` = 'S'
        AND `d_hd_dep_count` = 3
        AND `d_sales_price_tier` = '100-150')
    OR  (
            `d_cd_education_status` = 'Advanced Degree'
        AND `d_cd_marital_status` = 'D'
        AND `d_hd_dep_count` = 1
        AND `d_sales_price_tier` = ' 50-100')
    OR  (
            `d_cd_education_status` = '2 yr Degree'
        AND `d_cd_marital_status` = 'M'
        AND `d_hd_dep_count` = 1
        AND `d_sales_price_tier` = '150-200') )
AND ( (
            `d_customer_country` = 'United States'
        AND`d_customer_state` IN ('MS',
                                                           'NC',
                                                           'TX')
        AND`d_net_profit_tier` IN ('100-150',
                                                            '150-200') )
    OR  (
            `d_customer_country` = 'United States'
        AND`d_customer_state` IN ('TN',
                                                           'WA',
                                                           'NE')
        AND`d_net_profit_tier` IN ('150-200',
                                                            '200-250',
                                                            '250-300') )
    OR  (
            `d_customer_country` = 'United States'
        AND`d_customer_state` IN ('MA',
                                                           'OR',
                                                           'UT')
        AND`d_net_profit_tier` IN ( ' 50-100',
                                                            '100-150',
                                                            '150-200',
                                                            '200-250' ) ) );

 -- TPC-DS_query 15
SELECT
  `d_customer_zip_code` AS `d_customer_zip_code`,
  SUM(`m_CS_SALES_PRICE_sum`) AS `sum_m_cs_sales_price_sum_ok`
FROM
  `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
      (`d_customer_zip_code` IN (
        '80348',
        '81792',
        '83405',
        '85392',
        '85460',
        '85669',
        '86197',
        '86475',
        '88274')
    OR
      `d_customer_state` IN ('CA', 'GA', 'WA')
    OR  
        `d_catalog_sales_price_tier` = 'More than 500')
    AND
      `Sold Calendar Year` = 2001
    AND
      `Sold d_quarter_of_year` = 1
GROUP BY
  1
HAVING sum_m_cs_sales_price_sum_ok IS NOT NULL
ORDER BY 1
LIMIT 100;

 -- TPC-DS_query 26
SELECT
    `d_product_item_id` AS `d_product_item_id`,
    AVG( `m_catalog_sales_quantity_sold_avg` ) AS
    `avg_m_catalog_sales_quantity_sold_avg_ok`,
    AVG( `m_catalog_sales_list_price_avg` ) AS
    `avg_m_catalog_sales_list_price_avg_ok`,
    AVG( `m_catalog_sales_coupon_amount_avg` ) AS
    `sum_m_catalog_sales_coupon_amount_avg_ok`,
    AVG( `m_catalog_sales_sales_price_avg` ) AS
    `avg_m_catalog_sales_sales_price_avg_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    `d_product_item_id` IS NOT NULL
AND `Sold Calendar Year` = 2000
AND `d_cd_education_status` = 'College'
AND `d_cd_gender` = 'M'
AND `d_cd_marital_status` = 'M'
AND `d_channel_email` = 'N'
AND `d_channel_event` = 'N'
GROUP BY
    1
ORDER BY
    1 LIMIT 100;

 -- TPC-DS_query 31
SELECT
    `tpc_ds_benchmark_model`.`Sold Calendar Quarter`     AS `sold_calendar_quarter`,
    `tpc_ds_benchmark_model`.`Sold d_ca_county`          AS `sold_d_ca_county`,
    SUM(`tpc_ds_benchmark_model`.`Store Sales Increase`) AS `sum_store_sales_increase_ok`,
    SUM(`tpc_ds_benchmark_model`.`Web Sales Increase`)   AS `sum_web_sales_increase_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    `tpc_ds_benchmark_model`.`Sold Calendar Year` = 2001
GROUP BY
    1,
    2;

 -- TPC-DS_query 33
SELECT
    `d_product_manufacturer_id`     AS `d_product_manufacturer_id`,
    SUM( `Total  Ext Sales Price` ) AS `sum_total__ext_sales_price_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    `I Category` = 'Electronics'
AND `Sold Calendar Year-Week` = 1999
AND `Sold d_customer_gmt_offset` = -5.00
AND `Sold d_month_of_year` = 7
GROUP BY
    1
ORDER BY
    2 DESC LIMIT 100;

 -- TPC-DS_query 42
SELECT
  `Sold Calendar Year-Week` AS `sold_calendar_year_week`,
  `I Category` AS `i_category`,
  SUM(
    `m_ss_ext_sales_price_sum`
  ) AS `sum_m_ss_ext_sales_price_sum_ok`
FROM
  `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
  (
    (
      `Sold Calendar Year-Week` = 1998
    )
    AND (
      `Sold d_month_of_year` = 12
    )
    AND (
      `d_product_manager_id` = 1
    )
  )
GROUP BY
  1,
  2
ORDER BY 3 DESC;

 -- TPC-DS_query 48
SELECT
    SUM(`m_ss_quantity_sum`) AS `sum_m_ss_quantity_sum_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    `Sold Calendar Year-Week` = 1999
AND ((
            `d_cd_marital_status` = 'S'
        AND `d_cd_education_status` = 'Primary'
        AND `d_sales_price_tier` = '100-150' )
    OR  (
            `d_cd_marital_status` = 'U'
        AND `d_cd_education_status` = 'Advanced Degree'
        AND `d_sales_price_tier` = ' 50-100' )
    OR  (
            `d_cd_marital_status` = 'W'
        AND `d_cd_education_status` = '4 yr Degree'
        AND `d_sales_price_tier` = '150-200' ))
AND ((
            `Sold d_customer_country` = 'United States'
        AND `Sold d_customer_state` IN ('IL',
                                                                 'AR',
                                                                 'UT')
        AND `d_net_profit_tier` IN ('  0- 50',
                                                             ' 50-100',
                                                             '100-150',
                                                             '150-200',
                                                             '200-250',
                                                             '250-300',
                                                             '300-2000') )
    OR  (
            `Sold d_customer_country` = 'United States'
        AND `Sold d_customer_state` IN ('WV',
                                                                 'GA',
                                                                 'NC')
        AND `d_net_profit_tier` IN ('150-200',
                                                             '200-250',
                                                             '250-300',
                                                             '300-2000',
                                                             '2000-3000') )
    OR  (
            `Sold d_customer_country` = 'United States'
        AND `Sold d_customer_state` IN ('PA',
                                                                 'LA',
                                                                 'MO')
        AND `d_net_profit_tier` IN ( ' 50-100',
                                                             '100-150',
                                                             '150-200',
                                                             '200-250',
                                                             '250-300',
                                                             '300-2000',
                                                             '2000-3000',
                                                             '3000-25000') ) )
GROUP BY
    1;

 -- TPC-DS_query 50
SELECT
  `d_store_name` AS `d_store_name`,
  `d_store_company_id` AS `d_store_company_id`,
  `d_store_street_number` AS `d_store_street_number`,
  `d_store_street_name` AS `d_store_street_name`,
  `d_store_street_type` AS `d_store_street_type`,
  `d_store_suite_number` AS `d_store_suite_number`,
  `d_store_city` AS `d_store_city`,
  `d_store_county` AS `d_store_county`,
  `d_store_state` AS `d_store_state`,
  `d_store_zip_code` AS `d_store_zip_code`,
  `d_returns_time_tier` AS `d_returns_time_tier`,
  SUM(`m_returns_count_sum`) AS `sum_m_returns_count_sum_ok`
FROM
  `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
  (
    (
      `Return Calendar Year-Week` = 1998
    )
    AND (
      `Return d_month_of_year` = 9
    )
  )
GROUP BY
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11
ORDER BY
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11
LIMIT 100;

 -- TPC-DS_query 52
SELECT
  `Sold Calendar Year-Week` AS `sold_calendar_year_week`,
  `d_product_brand_id` AS `d_product_brand_id`,
  `d_product_brand_name` AS `d_product_brand_name`,
  SUM(
    `m_ss_ext_sales_price_sum`
  ) AS `sum_m_ss_ext_sales_price_sum_ok`
FROM
  `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
  (
    (
      `Sold Calendar Year-Week` = 2002
    )
    AND (
      `Sold d_month_of_year` = 12
    )
    AND (
      `d_product_manager_id` = 1
    )
  )
GROUP BY
  1,
  2,
  3
ORDER BY
  1,
  4 DESC,
  2
LIMIT 100;

 -- TPC-DS_query 53
SELECT
  `d_product_manufacturer_id` AS `d_product_manufacturer_id`,
  `Sold Calendar Quarter` AS `sold_calendar_quarter`,
  SUM(`m_store_sales_price`) AS `sum_m_store_sales_price_ok`,
  SUM(
    `Avg Quarterly Store Sales for 1998-1999`
  ) AS `sum_avg_quarterly_store_sales_for_1998_1999_ok`,
  SUM(
    `Avg Quarter Sales Ratio`
  ) AS `sum_avg_quarter_sales_ratio_ok`
FROM
  `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    `Sold Calendar Quarter` IN ('1998Q2', '1998Q3', '1998Q4', '1999Q1', '1999Q2') AND
    ((
        `I Category` IN ('Books',
                                                  'Children',
                                                  'Electronics')
    AND `d_product_brand_name` IN ( 'exportiunivamalg #9',
                                                            'scholaramalgamalg #14',
                                                            'scholaramalgamalg #7',
                                                            'scholaramalgamalg #9' )
    AND `d_product_class_name` IN ('personal',
                                                            'portable',
                                                            'reference',
                                                            'self-help') )
OR  (
        `I Category` IN ('Women',
                                                  'Music',
                                                  'Men')
    AND `d_product_brand_name` IN ( 'amalgimporto #1',
                                                            'edu packscholar #1',
                                                            'exportiimporto #1',
                                                            'importoamalg #1' )
    AND `d_product_class_name` IN ('accessories',
                                                            'classical',
                                                            'fragrances',
                                                            'pants') ) )
GROUP BY
    1,
    2
HAVING `sum_avg_quarter_sales_ratio_ok` > .1
ORDER BY
    1,
    2,
    3
LIMIT 100;

 -- TPC-DS_query 55
SELECT
  `d_product_brand_id` AS `d_product_brand_id`,
  `d_product_brand_name` AS `d_product_brand_name`,
  SUM(
    `m_ss_ext_sales_price_sum`
  ) AS `sum_m_ss_ext_sales_price_sum_ok`
FROM
  `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
  (
    (
      `Sold Calendar Year-Week` = 1998
    )
    AND (
      `Sold d_month_of_year` = 12
    )
    AND (
      `d_product_manager_id` = 90
    )
  )
GROUP BY
  1,
  2
ORDER BY 
  3  DESC
LIMIT 100;

 -- TPC-DS_query 56
SELECT
    `d_product_item_id`             AS `d_product_item_id`,
    SUM( `Total  Ext Sales Price` ) AS `sum_total__ext_sales_price_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    `Sold Calendar Year` = 2002
AND `Sold d_month_of_year` = 5
AND `Sold d_customer_gmt_offset` = -5.
AND `d_i_color` IN ('floral',
                                             'ivory',
                                             'royal')
GROUP BY
    1
ORDER BY 2
LIMIT 100;

 -- TPC-DS_query 60
SELECT
    `tpc_ds_benchmark_model`.`d_product_item_id` AS `d_product_item_id`,
    SUM( `tpc_ds_benchmark_model`.`Total  Ext Sales Price` ) AS `sum_total__ext_sales_price_ok`
FROM
    `tpc-ds benchmark model` `tpc_ds_benchmark_model`
WHERE
    `tpc_ds_benchmark_model`.`I Category` = 'Jewelry'
AND `tpc_ds_benchmark_model`.`Sold Calendar Year` = 1999
AND `tpc_ds_benchmark_model`.`Sold d_month_of_year` = 9
AND `tpc_ds_benchmark_model`.`d_customer_gmt_offset` = -6
GROUP BY
    1
ORDER BY
    1,
    2 
LIMIT 100;

 -- TPC-DS_query 61
SELECT
    SUM( `m_ss_ext_sales_price_promotion` ) AS
    `sum_m_ss_ext_sales_price_promotion_ok`,
    SUM( `m_ss_ext_sales_price_sum` ) AS `sum_m_ss_ext_sales_price_sum_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    (
        `d_channel_direct_mail` = 'Y'
    OR  `d_channel_email` = 'Y'
    OR  `d_channel_tv` = 'Y')
AND `I Category` = 'Home'
AND `Sold Calendar Year-Week` = 1998
AND `Sold d_month_of_year` = 12
AND `d_customer_gmt_offset` = -6.
AND `d_store_gmt_offset` = -6.
GROUP BY
    1
LIMIT 100;

 -- TPC-DS_query 71
SELECT
    `d_product_brand_id`            AS `d_product_brand_id`,
    `d_product_brand_name`          AS `d_product_brand_name`,
    `Sold d_hour`                   AS `sold_d_hour`,
    `Sold d_minute`                 AS `sold_d_minute`,
    SUM( `Total  Ext Sales Price` ) AS `sum_total__ext_sales_price_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    `Sold Calendar Year-Week` = 1998
AND `Sold d_meal_time` IN ('breakfast',
                                                    'dinner')
AND `Sold d_month_of_year` = 12
AND `d_product_manager_id` = 1
GROUP BY
    1,
    2,
    4,
    5
ORDER BY
    5 DESC,
    1
LIMIT 100;

 -- TPC-DS_query 88
SELECT
    `Sold d_morning _time_tier` AS `sold_d_morning__time_tier`,
    SUM(`m_SS Row Counter_sum`) AS `sum_m_ss_row_counter_sum_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
WHERE
    ( ( (
                `d_hd_dep_count` = 2
            AND `d_hd_vehicle_count` <= 4 )
        OR  (
                `d_hd_dep_count` = 0
            AND `d_hd_vehicle_count` <= 2 )
        OR  (
                `d_hd_dep_count` = -1
            AND `d_hd_vehicle_count` <= 1 ) )
    AND `d_store_name` = 'ese' )
    AND `Sold d_morning _time_tier` <> 'Other'
GROUP BY
    1;

 -- TPC-DS_query 96
SELECT
    SUM(`tpc_ds_benchmark_model`.`m_SS Row Counter_sum`) AS `sum_m_ss_row_counter_sum_ok`
FROM
    `tpc-ds benchmark model` `tpc_ds_benchmark_model`
WHERE
    `tpc_ds_benchmark_model`.`Sold d_hour` = 8
AND `tpc_ds_benchmark_model`.`Sold d_minute` >= 30
AND `tpc_ds_benchmark_model`.`d_hd_dep_count` = 5
AND `tpc_ds_benchmark_model`.`d_store_name` = 'ese'
GROUP BY
    1
ORDER BY
    1 
LIMIT 100;

 -- TPC-DS_query 98
SELECT
    `d_product_item_id`       AS `d_product_item_id`,
    `Product Dimension`       AS `product_dimension`,
    `I Category`              AS `i_category`,
    `d_product_class_name`    AS `d_product_class_name`,
    `d_product_current_price` AS `d_product_current_price`,
    SUM( (
            CASE
                WHEN `t0`.`x_measure__0` = 0
                THEN NULL
                ELSE `m_ss_ext_sales_price_sum`*100 / `t0`.`x_measure__0`
            END ) )                                     AS `sum_calculation_6026871858440298504_ok`,
    SUM( `m_ss_ext_sales_price_sum` ) AS `sum_m_ss_ext_sales_price_sum_ok`
FROM
    `tpc-ds benchmark model` `TPC-DS Benchmark Model`
JOIN
    (
        SELECT
            `d_product_class_name`            AS `d_product_class_name`,
            SUM( `m_ss_ext_sales_price_sum` ) AS `x_measure__0`
        FROM
            `tpc-ds benchmark model` `TPC-DS Benchmark Model`
        WHERE
            `I Category` IN ('Electronics',
                                                      'Shoes',
                                                      'Women')
        AND `Sold Time Dimension` BETWEEN '2002-05-27' AND '2002-06-26'
        GROUP BY
            1 ) `t0`
ON
    (
        `d_product_class_name` = `t0`.`d_product_class_name` )
WHERE
    `I Category` IN ('Electronics',
                                              'Shoes',
                                              'Women')
AND `Sold Time Dimension` BETWEEN '2002-05-27' AND '2002-06-26'
AND `Product Dimension` IS NOT NULL
AND `d_product_class_name` IS NOT NULL
GROUP BY
    1,
    2,
    3,
    4,
    5
ORDER BY
    3,
    4,
    1,
    2,
    7
LIMIT 100;
