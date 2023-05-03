-- Q2
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_91f378d4_q2`
(
  key_c1 STRING,
  key_c2 INT64,
  key_c3 INT64,
  key_c4 INT64,
  key_c5 INT64,
  key_c6 STRING,
  sold_calendar_week_c7 INT64,
  sold_calendar_year_week_c8 INT64,
  sold_d_day_name_week_c9 STRING,
  sold_d_week_seg_c10 INT64,
  m_cs_ext_sales_price_sum_c11 NUMERIC,
  m_cs_ext_sales_price_sum_c12 NUMERIC,
  m_cs_ext_sales_price_sum_c13 NUMERIC,
  m_ws_ext_sales_price_sum_c14 NUMERIC,
  m_ws_ext_sales_price_sum_c15 NUMERIC,
  m_ws_ext_sales_price_sum_c16 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=69f774fb-3e79-46ab-861d-bcf4853351c7 */
   t_359.key_c1 AS key_c1,
   t_359.key_c2 AS key_c2,
   t_359.key_c3 AS key_c3,
   t_359.key_c4 AS key_c4,
   t_359.key_c5 AS key_c5,
   t_359.key_c6 AS key_c6,
   t_359.sold_calendar_week_c7 AS sold_calendar_week_c7,
   t_359.sold_calendar_year_week_c8 AS sold_calendar_year_week_c8,
   t_359.sold_d_day_name_week_c9 AS sold_d_day_name_week_c9,
   t_359.sold_d_week_seg_c10 AS sold_d_week_seg_c10,
   MIN(t_359.m_cs_ext_sales_price_sum_c11) AS m_cs_ext_sales_price_sum_c11,
   MIN(t_359.m_cs_ext_sales_price_sum_c12) AS m_cs_ext_sales_price_sum_c12,
   MIN(t_359.m_cs_ext_sales_price_sum_c13) AS m_cs_ext_sales_price_sum_c13,
   MIN(t_359.m_ws_ext_sales_price_sum_c14) AS m_ws_ext_sales_price_sum_c14,
   MIN(t_359.m_ws_ext_sales_price_sum_c15) AS m_ws_ext_sales_price_sum_c15,
   MIN(t_359.m_ws_ext_sales_price_sum_c16) AS m_ws_ext_sales_price_sum_c16
FROM
(
      SELECT
         date_dim_t257.d_day_name AS key_c1,
         date_dim_t257.d_week_seq AS key_c2,
         date_dim_t257.d_week_seq AS key_c3,
         date_dim_t257.d_year AS key_c4,
         date_dim_t257.d_week_seq AS key_c5,
         date_dim_t257.d_day_name AS key_c6,
         date_dim_t257.d_week_seq AS sold_calendar_week_c7,
         date_dim_t257.d_year AS sold_calendar_year_week_c8,
         date_dim_t257.d_day_name AS sold_d_day_name_week_c9,
         date_dim_t257.d_week_seq AS sold_d_week_seg_c10,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c11,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c12,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c13,
         SAFE_CAST(SUM(web_sales_t256.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c14,
         SAFE_CAST(MIN(web_sales_t256.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c15,
         SAFE_CAST(MAX(web_sales_t256.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c16
      FROM
         `benchmark-251817`.TPCDS_10TB.web_sales AS web_sales_t256
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t257
      ON
         web_sales_t256.ws_sold_date_sk = date_dim_t257.d_date_sk
      WHERE
         true
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
         10
   UNION ALL
      SELECT
         date_dim_t315.d_day_name AS key_c1,
         date_dim_t315.d_week_seq AS key_c2,
         date_dim_t315.d_week_seq AS key_c3,
         date_dim_t315.d_year AS key_c4,
         date_dim_t315.d_week_seq AS key_c5,
         date_dim_t315.d_day_name AS key_c6,
         date_dim_t315.d_week_seq AS sold_calendar_week_c7,
         date_dim_t315.d_year AS sold_calendar_year_week_c8,
         date_dim_t315.d_day_name AS sold_d_day_name_week_c9,
         date_dim_t315.d_week_seq AS sold_d_week_seg_c10,
         SAFE_CAST(SUM(catalog_sales_t314.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c11,
         SAFE_CAST(MIN(catalog_sales_t314.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c12,
         SAFE_CAST(MAX(catalog_sales_t314.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c13,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c14,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c15,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c16
      FROM
         `benchmark-251817`.TPCDS_10TB.catalog_sales AS catalog_sales_t314
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t315
      ON
         catalog_sales_t314.cs_sold_date_sk = date_dim_t315.d_date_sk
      WHERE
         true
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
         10
) AS t_359
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
   10
-- AtScale Generated User Query
SELECT
/* queryId=653daa14-3bce-4a9c-a440-4f97c8f2675c */
   t_493.sold_calendar_week_gbakc4 AS sold_calendar_week,
   t_493.sold_d_day_name_we_gbakc5 AS sold_d_day_name_week,
   t_493.sold_d_week_seg_gbakc6 AS sold_d_week_seg,
   t_493.sum_web_catalog_sa_gbakc7 AS sum_web_catalog_sales_price_growth_ok
FROM
(
   SELECT
      t_442.sold_calendar_week_gbakc4 AS sold_calendar_week_gbakc4,
      t_442.sold_d_day_name_we_gbakc5 AS sold_d_day_name_we_gbakc5,
      t_442.sold_d_week_seg_gbakc6 AS sold_d_week_seg_gbakc6,
      CASE WHEN COALESCE(MIN(t_442.c_162), 0) = 0 THEN (SAFE_CAST('Infinity' AS FLOAT64) * SAFE_CAST(SIGN(CASE WHEN COALESCE(MIN(t_442.c_163), MIN(t_442.c_164)) IS NULL THEN NULL ELSE (COALESCE(MIN(t_442.c_163), 0) + COALESCE(MIN(t_442.c_164), 0)) END) AS FLOAT64)) ELSE CASE WHEN MIN(t_442.c_162) = 0 THEN NULL ELSE (CASE WHEN COALESCE(MIN(t_442.c_163), MIN(t_442.c_164)) IS NULL THEN NULL ELSE (COALESCE(MIN(t_442.c_163), 0) + COALESCE(MIN(t_442.c_164), 0)) END / MIN(t_442.c_162)) END END AS sum_web_catalog_sa_gbakc7,
      t_442.sold_calendar_week_gbakc1 AS sold_calendar_week_gbakc1,
      t_442.sold_d_day_name_we_gbakc2 AS sold_d_day_name_we_gbakc2,
      t_442.sold_d_week_seg_gbakc3 AS sold_d_week_seg_gbakc3
   FROM
   (
      SELECT
         t_441.sold_calendar_week_gbakc4 AS sold_calendar_week_gbakc4,
         t_441.sold_d_day_name_we_gbakc5 AS sold_d_day_name_we_gbakc5,
         t_441.sold_d_week_seg_gbakc6 AS sold_d_week_seg_gbakc6,
         MIN(t_441.c_162) AS c_162,
         MIN(t_441.c_163) AS c_163,
         MIN(t_441.c_164) AS c_164,
         t_441.sold_calendar_week_gbakc1 AS sold_calendar_week_gbakc1,
         t_441.sold_d_day_name_we_gbakc2 AS sold_d_day_name_we_gbakc2,
         t_441.sold_d_week_seg_gbakc3 AS sold_d_week_seg_gbakc3
      FROM
      (
            SELECT
               t_390.sold_calendar_week_c381 AS sold_calendar_week_gbakc4,
               t_390.sold_d_day_name_we_c385 AS sold_d_day_name_we_gbakc5,
               t_390.sold_d_week_seg_c1_c382 AS sold_d_week_seg_gbakc6,
               SAFE_CAST(NULL AS NUMERIC) AS c_162,
               SUM(t_390.m_ws_ext_sales_pri_c388) AS c_163,
               SUM(t_390.m_cs_ext_sales_pri_c384) AS c_164,
               t_390.key_c5_c387 AS sold_calendar_week_gbakc1,
               t_390.key_c6_c383 AS sold_d_day_name_we_gbakc2,
               t_390.key_c3_c386 AS sold_d_week_seg_gbakc3
            FROM
            (
               SELECT
                  as_agg_91f378d4_q2_t380.key_c3 AS key_c3_c386,
                  as_agg_91f378d4_q2_t380.key_c5 AS key_c5_c387,
                  as_agg_91f378d4_q2_t380.key_c6 AS key_c6_c383,
                  as_agg_91f378d4_q2_t380.m_cs_ext_sales_price_sum_c11 AS m_cs_ext_sales_pri_c384,
                  as_agg_91f378d4_q2_t380.m_ws_ext_sales_price_sum_c14 AS m_ws_ext_sales_pri_c388,
                  as_agg_91f378d4_q2_t380.sold_calendar_week_c7 AS sold_calendar_week_c381,
                  as_agg_91f378d4_q2_t380.sold_calendar_year_week_c8 AS sold_calendar_year_c389,
                  as_agg_91f378d4_q2_t380.sold_d_day_name_week_c9 AS sold_d_day_name_we_c385,
                  as_agg_91f378d4_q2_t380.sold_d_week_seg_c10 AS sold_d_week_seg_c1_c382
               FROM
                  `benchmark-251817`.aggregates.as_agg_91f378d4_q2 AS as_agg_91f378d4_q2_t380
               WHERE
                  as_agg_91f378d4_q2_t380.sold_calendar_year_week_c8 IN (2000, 2001)
            ) AS t_390
            WHERE
               true
            GROUP BY
               1,
               2,
               3,
               7,
               8,
               9
         UNION ALL
            SELECT
               t_433.sold_calendar_week_gbakc4 AS sold_calendar_week_gbakc4,
               t_433.sold_d_day_name_we_gbakc5 AS sold_d_day_name_we_gbakc5,
               t_433.sold_d_week_seg_gbakc6 AS sold_d_week_seg_gbakc6,
               MIN(t_433.c_162) AS c_162,
               SAFE_CAST(NULL AS NUMERIC) AS c_163,
               SAFE_CAST(NULL AS NUMERIC) AS c_164,
               t_433.sold_calendar_week_gbakc1 AS sold_calendar_week_gbakc1,
               t_433.sold_d_day_name_we_gbakc2 AS sold_d_day_name_we_gbakc2,
               t_433.sold_d_week_seg_gbakc3 AS sold_d_week_seg_gbakc3
            FROM
            (
               SELECT
                  COALESCE(t_426.c_155, t_422.sold_calendar_week_gbakc4) AS sold_calendar_week_gbakc4,
                  t_422.sold_d_day_name_we_gbakc5 AS sold_d_day_name_we_gbakc5,
                  COALESCE(t_426.c_157, t_422.sold_d_week_seg_gbakc6) AS sold_d_week_seg_gbakc6,
                  MIN(t_422.c_162) AS c_162,
                  SAFE_CAST(NULL AS NUMERIC) AS c_163,
                  SAFE_CAST(NULL AS NUMERIC) AS c_164,
                  COALESCE(t_426.c_231, t_422.sold_calendar_week_gbakc1) AS sold_calendar_week_gbakc1,
                  t_422.sold_d_day_name_we_gbakc2 AS sold_d_day_name_we_gbakc2,
                  COALESCE(t_426.c_178, t_422.sold_d_week_seg_gbakc3) AS sold_d_week_seg_gbakc3,
                  COALESCE(t_426.c_212, t_422.c_215) AS c_215
               FROM
               (
                  SELECT
                     t_425.c_231 AS c_231,
                     t_425.c_240 AS c_240,
                     t_405.c_212 AS c_212,
                     t_405.c_178 AS c_178,
                     t_405.c_155 AS c_155,
                     t_405.c_157 AS c_157
                  FROM
                  (
                     SELECT
                        t_424.c_234 AS c_231,
                        t_403.c_238 AS c_240
                     FROM
                     (
                        SELECT
                           t_400.rn_c233 AS rn_c233,
                           t_400.c_234 AS c_235,
                           t_400.c_234 AS c_234,
                           COALESCE(t_423.c_229, t_400.c_234) AS c_219
                        FROM
                        (
                           SELECT
                              t_394.c_224 AS c_224,
                              t_397.c_227 AS c_229
                           FROM
                           (
                              SELECT
                                 date_dim_t392.d_week_seq AS c_224,
                                 ROW_NUMBER() OVER (ORDER BY date_dim_t392.d_week_seq ASC ) AS rn_c223,
                                 date_dim_t392.d_week_seq AS c_221
                              FROM
                                 `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t392
                              WHERE
                                 true
                              GROUP BY
                                 1,
                                 3
                           ) AS t_394
                           JOIN
                           (
                              SELECT
                                 date_dim_t395.d_week_seq AS c_227,
                                 ROW_NUMBER() OVER (ORDER BY date_dim_t395.d_week_seq ASC ) AS rn_c226,
                                 date_dim_t395.d_week_seq AS c_221
                              FROM
                                 `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t395
                              WHERE
                                 true
                              GROUP BY
                                 1,
                                 3
                           ) AS t_397
                           ON
                              (t_394.rn_c223 + SAFE_CAST(53 AS INT64)) = t_397.rn_c226
                           GROUP BY
                              1,
                              2
                        ) AS t_423
                        JOIN
                        (
                           SELECT
                              date_dim_t398.d_week_seq AS c_234,
                              ROW_NUMBER() OVER (PARTITION BY date_dim_t398.d_week_seq) AS rn_c233
                           FROM
                              `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t398
                           WHERE
                              true
                           GROUP BY
                              1
                        ) AS t_400
                        ON
                           t_423.c_224 = t_400.c_234
                        GROUP BY
                           1,
                           2,
                           3,
                           4
                     ) AS t_424
                     JOIN
                     (
                        SELECT
                           date_dim_t401.d_week_seq AS c_238,
                           ROW_NUMBER() OVER (PARTITION BY date_dim_t401.d_week_seq) AS rn_c237
                        FROM
                           `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t401
                        WHERE
                           true
                        GROUP BY
                           1
                     ) AS t_403
                     ON
                        t_424.c_219 = t_403.c_238
                     AND
                        t_424.rn_c233 = t_403.rn_c237
                     GROUP BY
                        1,
                        2
                  ) AS t_425
                  JOIN
                  (
                     SELECT
                        date_dim_t404.d_week_seq AS c_242,
                        date_dim_t404.d_year AS c_212,
                        date_dim_t404.d_week_seq AS c_178,
                        date_dim_t404.d_week_seq AS c_155,
                        date_dim_t404.d_week_seq AS c_176,
                        date_dim_t404.d_week_seq AS c_157
                     FROM
                        `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t404
                     WHERE
                        true
                     GROUP BY
                        1,
                        2,
                        3,
                        4,
                        5,
                        6
                  ) AS t_405
                  ON
                     t_425.c_231 = t_405.c_176
                  GROUP BY
                     1,
                     2,
                     3,
                     4,
                     5,
                     6
               ) AS t_426
               JOIN
               (
                  SELECT
                     as_agg_91f378d4_q2_t412.sold_calendar_week_c7 AS sold_calendar_week_gbakc4,
                     as_agg_91f378d4_q2_t412.sold_d_day_name_week_c9 AS sold_d_day_name_we_gbakc5,
                     as_agg_91f378d4_q2_t412.sold_d_week_seg_c10 AS sold_d_week_seg_gbakc6,
                     CASE WHEN COALESCE(SUM(as_agg_91f378d4_q2_t412.m_ws_ext_sales_price_sum_c14), SUM(as_agg_91f378d4_q2_t412.m_cs_ext_sales_price_sum_c11)) IS NULL THEN NULL ELSE (COALESCE(SUM(as_agg_91f378d4_q2_t412.m_ws_ext_sales_price_sum_c14), 0) + COALESCE(SUM(as_agg_91f378d4_q2_t412.m_cs_ext_sales_price_sum_c11), 0)) END AS c_162,
                     as_agg_91f378d4_q2_t412.key_c5 AS sold_calendar_week_gbakc1,
                     as_agg_91f378d4_q2_t412.key_c6 AS sold_d_day_name_we_gbakc2,
                     as_agg_91f378d4_q2_t412.key_c3 AS sold_d_week_seg_gbakc3,
                     as_agg_91f378d4_q2_t412.key_c5 AS c_251,
                     as_agg_91f378d4_q2_t412.sold_calendar_year_week_c8 AS c_215,
                     as_agg_91f378d4_q2_t412.key_c5 AS c_216,
                     as_agg_91f378d4_q2_t412.key_c4 AS c_252,
                     t_417.c_415 AS c_253
                  FROM
                     `benchmark-251817`.aggregates.as_agg_91f378d4_q2 AS as_agg_91f378d4_q2_t412
                  JOIN
                  (
                     SELECT
                        CONCAT(SUBSTR(CAST(date_dim_t413.D_DATE AS STRING),1,4), '-', SUBSTR(CAST(date_dim_t413.D_DATE AS STRING),6,2),'-01') AS c_415,
                        date_dim_t413.d_week_seq AS d_week_seq_c414
                     FROM
                        `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t413
                     WHERE
                        true
                     GROUP BY
                        1,
                        2
                  ) AS t_417
                  ON
                     as_agg_91f378d4_q2_t412.key_c2 = t_417.d_week_seq_c414
                  WHERE
                     true
                  GROUP BY
                     1,
                     2,
                     3,
                     5,
                     6,
                     7,
                     8,
                     9,
                     10,
                     11,
                     12
               ) AS t_422
               ON
                  t_426.c_240 = t_422.c_216
               WHERE
                  COALESCE(t_426.c_212, t_422.c_215) IN (2000, 2001)
               GROUP BY
                  1,
                  2,
                  3,
                  7,
                  8,
                  9,
                  10
            ) AS t_433
            GROUP BY
               1,
               2,
               3,
               7,
               8,
               9
      ) AS t_441
      GROUP BY
         1,
         2,
         3,
         7,
         8,
         9
   ) AS t_442
   GROUP BY
      1,
      2,
      3,
      5,
      6,
      7
) AS t_493

-- Q7
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_75d20806_q7_q26`
(
  key_c1 STRING,
  key_c2 INT64,
  key_c3 STRING,
  key_c4 STRING,
  key_c5 STRING,
  key_c6 STRING,
  key_c7 STRING,
  key_c8 STRING,
  key_c9 STRING,
  key_c10 STRING,
  key_c11 STRING,
  key_c12 STRING,
  key_c13 STRING,
  sold_calendar_year_c14 INT64,
  d_cd_education_status_c15 STRING,
  d_cd_gender_c16 STRING,
  d_cd_marital_status_c17 STRING,
  d_channel_email_c18 STRING,
  d_channel_event_c19 STRING,
  d_product_item_id_c20 STRING,
  sumattrname_m_ss_quantity_c21 INT64,
  countattrname_m_ss_quanti_c22 INT64,
  sumattrname_m_catalog_sal_c23 NUMERIC,
  countattrname_m_catalog_s_c24 INT64,
  sumattrname_m_catalog_sal_c25 NUMERIC,
  countattrname_m_catalog_s_c26 INT64,
  sumattrname_m_catalog_sal_c27 INT64,
  countattrname_m_catalog_s_c28 INT64,
  sumattrname_m_catalog_sal_c29 NUMERIC,
  countattrname_m_catalog_s_c30 INT64,
  sumattrname_m_ss_coupon_a_c31 NUMERIC,
  countattrname_m_ss_coupon_c32 INT64,
  sumattrname_m_ss_list_pri_c33 NUMERIC,
  countattrname_m_ss_list_p_c34 INT64,
  sumattrname_m_ss_sales_pr_c35 NUMERIC,
  countattrname_m_ss_sales__c36 INT64
);
-- AtScale Agg Creation Query
SELECT
/* queryId=60f4d86c-7715-430f-8bac-3fd28b725b61 */
   t_1073.key_c1 AS key_c1,
   t_1073.key_c2 AS key_c2,
   t_1073.key_c3 AS key_c3,
   t_1073.key_c4 AS key_c4,
   t_1073.key_c5 AS key_c5,
   t_1073.key_c6 AS key_c6,
   t_1073.key_c7 AS key_c7,
   t_1073.key_c8 AS key_c8,
   t_1073.key_c9 AS key_c9,
   t_1073.key_c10 AS key_c10,
   t_1073.key_c11 AS key_c11,
   t_1073.key_c12 AS key_c12,
   t_1073.key_c13 AS key_c13,
   t_1073.sold_calendar_year_c14 AS sold_calendar_year_c14,
   t_1073.d_cd_education_status_c15 AS d_cd_education_status_c15,
   t_1073.d_cd_gender_c16 AS d_cd_gender_c16,
   t_1073.d_cd_marital_status_c17 AS d_cd_marital_status_c17,
   t_1073.d_channel_email_c18 AS d_channel_email_c18,
   t_1073.d_channel_event_c19 AS d_channel_event_c19,
   t_1073.d_product_item_id_c20 AS d_product_item_id_c20,
   MIN(t_1073.sumattrname_m_ss_quantity_c21) AS sumattrname_m_ss_quantity_c21,
   MIN(t_1073.countattrname_m_ss_quanti_c22) AS countattrname_m_ss_quanti_c22,
   MIN(t_1073.sumattrname_m_catalog_sal_c23) AS sumattrname_m_catalog_sal_c23,
   MIN(t_1073.countattrname_m_catalog_s_c24) AS countattrname_m_catalog_s_c24,
   MIN(t_1073.sumattrname_m_catalog_sal_c25) AS sumattrname_m_catalog_sal_c25,
   MIN(t_1073.countattrname_m_catalog_s_c26) AS countattrname_m_catalog_s_c26,
   MIN(t_1073.sumattrname_m_catalog_sal_c27) AS sumattrname_m_catalog_sal_c27,
   MIN(t_1073.countattrname_m_catalog_s_c28) AS countattrname_m_catalog_s_c28,
   MIN(t_1073.sumattrname_m_catalog_sal_c29) AS sumattrname_m_catalog_sal_c29,
   MIN(t_1073.countattrname_m_catalog_s_c30) AS countattrname_m_catalog_s_c30,
   MIN(t_1073.sumattrname_m_ss_coupon_a_c31) AS sumattrname_m_ss_coupon_a_c31,
   MIN(t_1073.countattrname_m_ss_coupon_c32) AS countattrname_m_ss_coupon_c32,
   MIN(t_1073.sumattrname_m_ss_list_pri_c33) AS sumattrname_m_ss_list_pri_c33,
   MIN(t_1073.countattrname_m_ss_list_p_c34) AS countattrname_m_ss_list_p_c34,
   MIN(t_1073.sumattrname_m_ss_sales_pr_c35) AS sumattrname_m_ss_sales_pr_c35,
   MIN(t_1073.countattrname_m_ss_sales__c36) AS countattrname_m_ss_sales__c36
FROM
(
      SELECT
         t_569.p_channel_email_c567 AS key_c1,
         date_dim_t564.d_year AS key_c2,
         t_569.p_channel_event_c568 AS key_c3,
         t_569.p_channel_email_c567 AS key_c4,
         item_t562.i_item_id AS key_c5,
         t_569.p_channel_event_c568 AS key_c6,
         customer_demograph_t563.cd_marital_status AS key_c7,
         customer_demograph_t563.cd_gender AS key_c8,
         customer_demograph_t563.cd_education_status AS key_c9,
         customer_demograph_t563.cd_marital_status AS key_c10,
         item_t562.i_item_id AS key_c11,
         customer_demograph_t563.cd_gender AS key_c12,
         customer_demograph_t563.cd_education_status AS key_c13,
         date_dim_t564.d_year AS sold_calendar_year_c14,
         customer_demograph_t563.cd_education_status AS d_cd_education_status_c15,
         customer_demograph_t563.cd_gender AS d_cd_gender_c16,
         customer_demograph_t563.cd_marital_status AS d_cd_marital_status_c17,
         t_569.p_channel_email_c567 AS d_channel_email_c18,
         t_569.p_channel_event_c568 AS d_channel_event_c19,
         item_t562.i_item_id AS d_product_item_id_c20,
         SAFE_CAST(SUM(store_sales_t561.ss_quantity) AS INT64) AS sumattrname_m_ss_quantity_c21,
         SAFE_CAST(COUNT(store_sales_t561.ss_quantity) AS INT64) AS countattrname_m_ss_quanti_c22,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_catalog_sal_c23,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_catalog_s_c24,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_catalog_sal_c25,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_catalog_s_c26,
         SAFE_CAST(NULL AS INT64) AS sumattrname_m_catalog_sal_c27,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_catalog_s_c28,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_catalog_sal_c29,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_catalog_s_c30,
         SAFE_CAST(SUM(store_sales_t561.ss_coupon_amt) AS NUMERIC) AS sumattrname_m_ss_coupon_a_c31,
         SAFE_CAST(COUNT(store_sales_t561.ss_coupon_amt) AS INT64) AS countattrname_m_ss_coupon_c32,
         SAFE_CAST(SUM(store_sales_t561.ss_list_price) AS NUMERIC) AS sumattrname_m_ss_list_pri_c33,
         SAFE_CAST(COUNT(store_sales_t561.ss_list_price) AS INT64) AS countattrname_m_ss_list_p_c34,
         SAFE_CAST(SUM(store_sales_t561.ss_sales_price) AS NUMERIC) AS sumattrname_m_ss_sales_pr_c35,
         SAFE_CAST(COUNT(store_sales_t561.ss_sales_price) AS INT64) AS countattrname_m_ss_sales__c36
      FROM
         `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t561
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t562
      ON
         store_sales_t561.ss_item_sk = item_t562.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_demographics AS customer_demograph_t563
      ON
         store_sales_t561.ss_cdemo_sk = customer_demograph_t563.cd_demo_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t564
      ON
         store_sales_t561.ss_sold_date_sk = date_dim_t564.d_date_sk
      JOIN
      (
         SELECT
            promotion_t565.p_channel_email AS p_channel_email_c567,
            promotion_t565.p_channel_event AS p_channel_event_c568,
            promotion_t565.p_promo_sk AS p_promo_sk_c566
         FROM
            `benchmark-251817`.TPCDS_10TB.promotion AS promotion_t565
         WHERE
            true
         GROUP BY
            1,
            2,
            3
      ) AS t_569
      ON
         store_sales_t561.ss_promo_sk = t_569.p_promo_sk_c566
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20
   UNION ALL
      SELECT
         t_839.p_channel_email_c837 AS key_c1,
         date_dim_t834.d_year AS key_c2,
         t_839.p_channel_event_c838 AS key_c3,
         t_839.p_channel_email_c837 AS key_c4,
         item_t832.i_item_id AS key_c5,
         t_839.p_channel_event_c838 AS key_c6,
         customer_demograph_t833.cd_marital_status AS key_c7,
         customer_demograph_t833.cd_gender AS key_c8,
         customer_demograph_t833.cd_education_status AS key_c9,
         customer_demograph_t833.cd_marital_status AS key_c10,
         item_t832.i_item_id AS key_c11,
         customer_demograph_t833.cd_gender AS key_c12,
         customer_demograph_t833.cd_education_status AS key_c13,
         date_dim_t834.d_year AS sold_calendar_year_c14,
         customer_demograph_t833.cd_education_status AS d_cd_education_status_c15,
         customer_demograph_t833.cd_gender AS d_cd_gender_c16,
         customer_demograph_t833.cd_marital_status AS d_cd_marital_status_c17,
         t_839.p_channel_email_c837 AS d_channel_email_c18,
         t_839.p_channel_event_c838 AS d_channel_event_c19,
         item_t832.i_item_id AS d_product_item_id_c20,
         SAFE_CAST(NULL AS INT64) AS sumattrname_m_ss_quantity_c21,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_ss_quanti_c22,
         SAFE_CAST(SUM(catalog_sales_t831.cs_coupon_amt) AS NUMERIC) AS sumattrname_m_catalog_sal_c23,
         SAFE_CAST(COUNT(catalog_sales_t831.cs_coupon_amt) AS INT64) AS countattrname_m_catalog_s_c24,
         SAFE_CAST(SUM(catalog_sales_t831.cs_list_price) AS NUMERIC) AS sumattrname_m_catalog_sal_c25,
         SAFE_CAST(COUNT(catalog_sales_t831.cs_list_price) AS INT64) AS countattrname_m_catalog_s_c26,
         SAFE_CAST(SUM(catalog_sales_t831.cs_quantity) AS INT64) AS sumattrname_m_catalog_sal_c27,
         SAFE_CAST(COUNT(catalog_sales_t831.cs_quantity) AS INT64) AS countattrname_m_catalog_s_c28,
         SAFE_CAST(SUM(catalog_sales_t831.cs_sales_price) AS NUMERIC) AS sumattrname_m_catalog_sal_c29,
         SAFE_CAST(COUNT(catalog_sales_t831.cs_sales_price) AS INT64) AS countattrname_m_catalog_s_c30,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_ss_coupon_a_c31,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_ss_coupon_c32,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_ss_list_pri_c33,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_ss_list_p_c34,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_ss_sales_pr_c35,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_ss_sales__c36
      FROM
         `benchmark-251817`.TPCDS_10TB.catalog_sales AS catalog_sales_t831
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t832
      ON
         catalog_sales_t831.cs_item_sk = item_t832.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_demographics AS customer_demograph_t833
      ON
         catalog_sales_t831.cs_bill_cdemo_sk = customer_demograph_t833.cd_demo_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t834
      ON
         catalog_sales_t831.cs_sold_date_sk = date_dim_t834.d_date_sk
      JOIN
      (
         SELECT
            promotion_t835.p_channel_email AS p_channel_email_c837,
            promotion_t835.p_channel_event AS p_channel_event_c838,
            promotion_t835.p_promo_sk AS p_promo_sk_c836
         FROM
            `benchmark-251817`.TPCDS_10TB.promotion AS promotion_t835
         WHERE
            true
         GROUP BY
            1,
            2,
            3
      ) AS t_839
      ON
         catalog_sales_t831.cs_promo_sk = t_839.p_promo_sk_c836
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20
) AS t_1073
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
   11,
   12,
   13,
   14,
   15,
   16,
   17,
   18,
   19,
   20
-- AtScale Generated User Query
SELECT
/* queryId=43ed753b-d682-446f-b852-7560cba8ddaa */
   t_224.d_product_item_id_gbakc2 AS d_product_item_id,
   t_224.avg_m_ss_quantity__gbakc3 AS avg_m_ss_quantity_avg_ok,
   t_224.avg_m_ss_list_pric_gbakc4 AS avg_m_ss_list_price_avg_ok,
   t_224.avg_m_ss_coupon_am_gbakc5 AS avg_m_ss_coupon_amt_avg_ok,
   t_224.avg_m_ss_sales_pri_gbakc6 AS avg_m_ss_sales_price_avg_ok
FROM
(
   SELECT
      t_174.d_product_item_id__c173 AS d_product_item_id_gbakc2,
      CASE WHEN SUM(t_174.countattrname_m_ss_c172) = 0 THEN NULL ELSE (SUM(t_174.sumattrname_m_ss_q_c159) / SUM(t_174.countattrname_m_ss_c172)) END AS avg_m_ss_quantity__gbakc3,
      CASE WHEN SUM(t_174.countattrname_m_ss_c166) = 0 THEN NULL ELSE (SUM(t_174.sumattrname_m_ss_l_c163) / SUM(t_174.countattrname_m_ss_c166)) END AS avg_m_ss_list_pric_gbakc4,
      CASE WHEN SUM(t_174.countattrname_m_ss_c170) = 0 THEN NULL ELSE (SUM(t_174.sumattrname_m_ss_c_c169) / SUM(t_174.countattrname_m_ss_c170)) END AS avg_m_ss_coupon_am_gbakc5,
      CASE WHEN SUM(t_174.countattrname_m_ss_c162) = 0 THEN NULL ELSE (SUM(t_174.sumattrname_m_ss_s_c164) / SUM(t_174.countattrname_m_ss_c162)) END AS avg_m_ss_sales_pri_gbakc6,
      t_174.key_c11_c168 AS d_product_item_id_gbakc1
   FROM
   (
      SELECT
         as_agg_75d20806_q7_t157.countattrname_m_ss_sales__c36 AS countattrname_m_ss_c162,
         as_agg_75d20806_q7_t157.countattrname_m_ss_list_p_c34 AS countattrname_m_ss_c166,
         as_agg_75d20806_q7_t157.countattrname_m_ss_coupon_c32 AS countattrname_m_ss_c170,
         as_agg_75d20806_q7_t157.countattrname_m_ss_quanti_c22 AS countattrname_m_ss_c172,
         as_agg_75d20806_q7_t157.d_cd_education_status_c15 AS d_cd_education_sta_c158,
         as_agg_75d20806_q7_t157.d_cd_gender_c16 AS d_cd_gender_c16_c165,
         as_agg_75d20806_q7_t157.d_cd_marital_status_c17 AS d_cd_marital_statu_c160,
         as_agg_75d20806_q7_t157.d_channel_email_c18 AS d_channel_email_c1_c161,
         as_agg_75d20806_q7_t157.d_channel_event_c19 AS d_channel_event_c1_c171,
         as_agg_75d20806_q7_t157.d_product_item_id_c20 AS d_product_item_id__c173,
         as_agg_75d20806_q7_t157.key_c11 AS key_c11_c168,
         as_agg_75d20806_q7_t157.sold_calendar_year_c14 AS sold_calendar_year_c167,
         as_agg_75d20806_q7_t157.sumattrname_m_ss_coupon_a_c31 AS sumattrname_m_ss_c_c169,
         as_agg_75d20806_q7_t157.sumattrname_m_ss_list_pri_c33 AS sumattrname_m_ss_l_c163,
         as_agg_75d20806_q7_t157.sumattrname_m_ss_quantity_c21 AS sumattrname_m_ss_q_c159,
         as_agg_75d20806_q7_t157.sumattrname_m_ss_sales_pr_c35 AS sumattrname_m_ss_s_c164
      FROM
         `benchmark-251817`.aggregates.as_agg_75d20806_q7_q26 AS as_agg_75d20806_q7_t157
      WHERE
         as_agg_75d20806_q7_t157.d_cd_marital_status_c17 = 'M'
      AND
         as_agg_75d20806_q7_t157.d_cd_gender_c16 = 'M'
      AND
         as_agg_75d20806_q7_t157.d_cd_education_status_c15 = '4 yr Degree'
      AND
      (
            as_agg_75d20806_q7_t157.d_channel_email_c18 = 'N'
         OR
            as_agg_75d20806_q7_t157.d_channel_event_c19 = 'N' )
      AND
         as_agg_75d20806_q7_t157.sold_calendar_year_c14 = 2001
   ) AS t_174
   WHERE
      true
   GROUP BY
      1,
      6
) AS t_224
ORDER BY
   1 ASC
LIMIT 100

-- Q13
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_8c61a64a_q13`
(
  key_c1 INT64,
  key_c2 STRING,
  key_c3 STRING,
  key_c4 STRING,
  key_c5 INT64,
  key_c6 STRING,
  key_c7 INT64,
  key_c8 STRING,
  key_c9 STRING,
  key_c10 STRING,
  key_c11 STRING,
  key_c12 STRING,
  sold_calendar_year_week_c13 INT64,
  d_cd_education_status_c14 STRING,
  d_cd_marital_status_c15 STRING,
  d_customer_country_c16 STRING,
  d_customer_state_c17 STRING,
  d_hd_dep_count_c18 INT64,
  d_net_profit_tier_c19 STRING,
  d_sales_price_tier_c20 STRING,
  sumattrname_m_ss_ext_sale_c21 NUMERIC,
  countattrname_m_ss_ext_sa_c22 INT64,
  sumattrname_m_ss_ext_whol_c23 NUMERIC,
  countattrname_m_ss_ext_wh_c24 INT64,
  sumattrname_m_ss_quantity_c25 INT64,
  countattrname_m_ss_quanti_c26 INT64,
  m_ss_ext_wholesale_cost_s_c27 NUMERIC,
  m_ss_ext_wholesale_cost_s_c28 NUMERIC,
  m_ss_ext_wholesale_cost_s_c29 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=47568f9c-00ce-47fb-bbc8-082697fa6487 */
   household_demograp_t352.hd_dep_count AS key_c1,
   CASE WHEN store_sales_t349.SS_NET_PROFIT > 25000 THEN 'More than 25000'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 3000 AND 25000 THEN '3000-25000'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 2000 AND 3000 THEN '2000-3000'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 300 AND 2000 THEN '300-2000'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 250 AND 300 THEN '250-300'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 200 AND 250 THEN '200-250'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 150 AND 200 THEN '150-200'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 100 AND 150 THEN '100-150'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 50 AND 100 THEN ' 50-100'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 0 AND 50 THEN '  0- 50'
ELSE ' 50 or Less' END AS key_c2,
   CASE WHEN store_sales_t349.SS_SALES_PRICE > 200 THEN '200 and More'
WHEN store_sales_t349.SS_SALES_PRICE BETWEEN 150 AND 200 THEN '150-200'
WHEN store_sales_t349.SS_SALES_PRICE BETWEEN 100 AND 150 THEN '100-150'
WHEN store_sales_t349.SS_SALES_PRICE BETWEEN 50 AND 100 THEN ' 50-100'
ELSE ' 50 and Less' END AS key_c3,
   customer_demograph_t354.cd_marital_status AS key_c4,
   date_dim_t356.d_year AS key_c5,
   customer_demograph_t354.cd_education_status AS key_c6,
   household_demograp_t352.hd_dep_count AS key_c7,
   customer_demograph_t354.cd_marital_status AS key_c8,
   customer_address_t355.ca_country AS key_c9,
   customer_address_t355.ca_state AS key_c10,
   customer_demograph_t354.cd_education_status AS key_c11,
   customer_address_t355.ca_country AS key_c12,
   date_dim_t356.d_year AS sold_calendar_year_week_c13,
   customer_demograph_t354.cd_education_status AS d_cd_education_status_c14,
   customer_demograph_t354.cd_marital_status AS d_cd_marital_status_c15,
   customer_address_t355.ca_country AS d_customer_country_c16,
   customer_address_t355.ca_state AS d_customer_state_c17,
   household_demograp_t352.hd_dep_count AS d_hd_dep_count_c18,
   CASE WHEN store_sales_t349.SS_NET_PROFIT > 25000 THEN 'More than 25000'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 3000 AND 25000 THEN '3000-25000'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 2000 AND 3000 THEN '2000-3000'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 300 AND 2000 THEN '300-2000'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 250 AND 300 THEN '250-300'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 200 AND 250 THEN '200-250'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 150 AND 200 THEN '150-200'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 100 AND 150 THEN '100-150'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 50 AND 100 THEN ' 50-100'
WHEN store_sales_t349.SS_NET_PROFIT BETWEEN 0 AND 50 THEN '  0- 50'
ELSE ' 50 or Less' END AS d_net_profit_tier_c19,
   CASE WHEN store_sales_t349.SS_SALES_PRICE > 200 THEN '200 and More'
WHEN store_sales_t349.SS_SALES_PRICE BETWEEN 150 AND 200 THEN '150-200'
WHEN store_sales_t349.SS_SALES_PRICE BETWEEN 100 AND 150 THEN '100-150'
WHEN store_sales_t349.SS_SALES_PRICE BETWEEN 50 AND 100 THEN ' 50-100'
ELSE ' 50 and Less' END AS d_sales_price_tier_c20,
   SAFE_CAST(SUM(store_sales_t349.ss_ext_sales_price) AS NUMERIC) AS sumattrname_m_ss_ext_sale_c21,
   SAFE_CAST(COUNT(store_sales_t349.ss_ext_sales_price) AS INT64) AS countattrname_m_ss_ext_sa_c22,
   SAFE_CAST(SUM(store_sales_t349.ss_ext_wholesale_cost) AS NUMERIC) AS sumattrname_m_ss_ext_whol_c23,
   SAFE_CAST(COUNT(store_sales_t349.ss_ext_wholesale_cost) AS INT64) AS countattrname_m_ss_ext_wh_c24,
   SAFE_CAST(SUM(store_sales_t349.ss_quantity) AS INT64) AS sumattrname_m_ss_quantity_c25,
   SAFE_CAST(COUNT(store_sales_t349.ss_quantity) AS INT64) AS countattrname_m_ss_quanti_c26,
   SAFE_CAST(SUM(store_sales_t349.ss_ext_wholesale_cost) AS NUMERIC) AS m_ss_ext_wholesale_cost_s_c27,
   SAFE_CAST(MIN(store_sales_t349.ss_ext_wholesale_cost) AS NUMERIC) AS m_ss_ext_wholesale_cost_s_c28,
   SAFE_CAST(MAX(store_sales_t349.ss_ext_wholesale_cost) AS NUMERIC) AS m_ss_ext_wholesale_cost_s_c29
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t349
JOIN
   `benchmark-251817`.TPCDS_10TB.household_demographics AS household_demograp_t352
ON
   store_sales_t349.ss_hdemo_sk = household_demograp_t352.hd_demo_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.customer AS customer_t353
ON
   store_sales_t349.ss_customer_sk = customer_t353.c_customer_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.customer_demographics AS customer_demograph_t354
ON
   store_sales_t349.ss_cdemo_sk = customer_demograph_t354.cd_demo_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t355
ON
   customer_t353.c_current_addr_sk = customer_address_t355.ca_address_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t356
ON
   store_sales_t349.ss_sold_date_sk = date_dim_t356.d_date_sk
WHERE
   true
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
   11,
   12,
   13,
   14,
   15,
   16,
   17,
   18,
   19,
   20
-- AtScale Generated User Query
SELECT
/* queryId=f1cdfdcb-c311-4e75-922e-83a5d9739d87 */
   CASE WHEN SUM(t_205.countattrname_m_ss_c194) = 0 THEN NULL ELSE (SUM(t_205.sumattrname_m_ss_q_c203) / SUM(t_205.countattrname_m_ss_c194)) END AS sum_m_ss_quantity_avg_ok,
   CASE WHEN SUM(t_205.countattrname_m_ss_c195) = 0 THEN NULL ELSE (SUM(t_205.sumattrname_m_ss_e_c191) / SUM(t_205.countattrname_m_ss_c195)) END AS sum_m_ss_ext_sales_price_avg_ok,
   CASE WHEN SUM(t_205.countattrname_m_ss_c202) = 0 THEN NULL ELSE (SUM(t_205.sumattrname_m_ss_e_c201) / SUM(t_205.countattrname_m_ss_c202)) END AS sum_m_ss_ext_wholesale_cost_avg_ok,
   SUM(t_205.m_ss_ext_wholesale_c196) AS sum_m_ss_ext_wholesale_cost_sum_ok
FROM
(
   SELECT
      as_agg_8c61a64a_q1_t189.countattrname_m_ss_quanti_c26 AS countattrname_m_ss_c194,
      as_agg_8c61a64a_q1_t189.countattrname_m_ss_ext_sa_c22 AS countattrname_m_ss_c195,
      as_agg_8c61a64a_q1_t189.countattrname_m_ss_ext_wh_c24 AS countattrname_m_ss_c202,
      as_agg_8c61a64a_q1_t189.d_cd_education_status_c14 AS d_cd_education_sta_c198,
      as_agg_8c61a64a_q1_t189.d_cd_marital_status_c15 AS d_cd_marital_statu_c192,
      as_agg_8c61a64a_q1_t189.d_customer_country_c16 AS d_customer_country_c197,
      as_agg_8c61a64a_q1_t189.d_customer_state_c17 AS d_customer_state_c_c200,
      as_agg_8c61a64a_q1_t189.d_hd_dep_count_c18 AS d_hd_dep_count_c18_c199,
      as_agg_8c61a64a_q1_t189.d_net_profit_tier_c19 AS d_net_profit_tier__c193,
      as_agg_8c61a64a_q1_t189.d_sales_price_tier_c20 AS d_sales_price_tier_c190,
      as_agg_8c61a64a_q1_t189.m_ss_ext_wholesale_cost_s_c27 AS m_ss_ext_wholesale_c196,
      as_agg_8c61a64a_q1_t189.sold_calendar_year_week_c13 AS sold_calendar_year_c204,
      as_agg_8c61a64a_q1_t189.sumattrname_m_ss_ext_sale_c21 AS sumattrname_m_ss_e_c191,
      as_agg_8c61a64a_q1_t189.sumattrname_m_ss_ext_whol_c23 AS sumattrname_m_ss_e_c201,
      as_agg_8c61a64a_q1_t189.sumattrname_m_ss_quantity_c25 AS sumattrname_m_ss_q_c203
   FROM
      `benchmark-251817`.aggregates.as_agg_8c61a64a_q13 AS as_agg_8c61a64a_q1_t189
   WHERE
   (
            as_agg_8c61a64a_q1_t189.d_net_profit_tier_c19 IN ('100-150', '150-200')
         AND
            as_agg_8c61a64a_q1_t189.d_customer_country_c16 = 'United States'
         AND
            as_agg_8c61a64a_q1_t189.d_customer_state_c17 IN ('MS', 'NC', 'TX')
      OR
            as_agg_8c61a64a_q1_t189.d_net_profit_tier_c19 IN ('150-200', '200-250', '250-300')
         AND
            as_agg_8c61a64a_q1_t189.d_customer_country_c16 = 'United States'
         AND
            as_agg_8c61a64a_q1_t189.d_customer_state_c17 IN ('TN', 'WA', 'NE')
      OR
            as_agg_8c61a64a_q1_t189.d_net_profit_tier_c19 IN (' 50-100', '100-150', '150-200', '200-250')
         AND
            as_agg_8c61a64a_q1_t189.d_customer_country_c16 = 'United States'
         AND
            as_agg_8c61a64a_q1_t189.d_customer_state_c17 IN ('MA', 'OR', 'UT') )
   AND
      as_agg_8c61a64a_q1_t189.sold_calendar_year_week_c13 = 2001
   AND
   (
            as_agg_8c61a64a_q1_t189.d_sales_price_tier_c20 = '100-150'
         AND
            as_agg_8c61a64a_q1_t189.d_hd_dep_count_c18 = 3
         AND
            as_agg_8c61a64a_q1_t189.d_cd_education_status_c14 = '4 yr Degree'
         AND
            as_agg_8c61a64a_q1_t189.d_cd_marital_status_c15 = 'S'
      OR
            as_agg_8c61a64a_q1_t189.d_sales_price_tier_c20 = ' 50-100'
         AND
            as_agg_8c61a64a_q1_t189.d_hd_dep_count_c18 = 1
         AND
            as_agg_8c61a64a_q1_t189.d_cd_education_status_c14 = 'Advanced Degree'
         AND
            as_agg_8c61a64a_q1_t189.d_cd_marital_status_c15 = 'D'
      OR
            as_agg_8c61a64a_q1_t189.d_sales_price_tier_c20 = '150-200'
         AND
            as_agg_8c61a64a_q1_t189.d_hd_dep_count_c18 = 1
         AND
            as_agg_8c61a64a_q1_t189.d_cd_education_status_c14 = '2 yr Degree'
         AND
            as_agg_8c61a64a_q1_t189.d_cd_marital_status_c15 = 'M' )
) AS t_205
WHERE
   true

-- Q15
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_bf42122c_q15`
(
  key_c1 INT64,
  key_c2 INT64,
  key_c3 INT64,
  key_c4 STRING,
  key_c5 STRING,
  key_c6 STRING,
  key_c7 STRING,
  key_c8 STRING,
  sold_calendar_year_c9 INT64,
  sold_d_quarter_of_year_c10 INT64,
  d_catalog_sales_price_tie_c11 STRING,
  d_customer_state_c12 STRING,
  d_customer_zip_code_c13 STRING,
  m_cs_sales_price_sum_c14 NUMERIC,
  m_cs_sales_price_sum_c15 NUMERIC,
  m_cs_sales_price_sum_c16 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=47c2bdd3-35e3-4782-b547-b25cfe7b2f3d */
   date_dim_t196.d_qoy AS key_c1,
   date_dim_t196.d_year AS key_c2,
   date_dim_t196.d_qoy AS key_c3,
   customer_address_t195.ca_zip AS key_c4,
   CASE WHEN catalog_sales_t193.CS_SALES_PRICE BETWEEN 0 AND 500 THEN '500 or Less' ELSE 'More than 500' END AS key_c5,
   customer_address_t195.ca_country AS key_c6,
   customer_address_t195.ca_state AS key_c7,
   customer_address_t195.ca_zip AS key_c8,
   date_dim_t196.d_year AS sold_calendar_year_c9,
   date_dim_t196.d_qoy AS sold_d_quarter_of_year_c10,
   CASE WHEN catalog_sales_t193.CS_SALES_PRICE BETWEEN 0 AND 500 THEN '500 or Less' ELSE 'More than 500' END AS d_catalog_sales_price_tie_c11,
   customer_address_t195.ca_state AS d_customer_state_c12,
   customer_address_t195.ca_zip AS d_customer_zip_code_c13,
   SAFE_CAST(SUM(catalog_sales_t193.cs_sales_price) AS NUMERIC) AS m_cs_sales_price_sum_c14,
   SAFE_CAST(MIN(catalog_sales_t193.cs_sales_price) AS NUMERIC) AS m_cs_sales_price_sum_c15,
   SAFE_CAST(MAX(catalog_sales_t193.cs_sales_price) AS NUMERIC) AS m_cs_sales_price_sum_c16
FROM
   `benchmark-251817`.TPCDS_10TB.catalog_sales AS catalog_sales_t193
JOIN
   `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t195
ON
   catalog_sales_t193.cs_ship_addr_sk = customer_address_t195.ca_address_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t196
ON
   catalog_sales_t193.cs_sold_date_sk = date_dim_t196.d_date_sk
WHERE
   true
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
   11,
   12,
   13
-- AtScale Generated User Query
SELECT
/* queryId=b54402e1-dc22-468d-a0d8-88cbaa3035b9 */
   t_77.d_customer_zip_cod_gbakc2 AS d_customer_zip_code,
   t_77.sum_m_cs_sales_pri_gbakc3 AS sum_m_cs_sales_price_sum_ok
FROM
(
   SELECT
      t_75.d_customer_zip_cod_c70 AS d_customer_zip_cod_gbakc2,
      SUM(t_75.m_cs_sales_price_s_c72) AS sum_m_cs_sales_pri_gbakc3,
      t_75.key_c4_c69 AS d_customer_zip_cod_gbakc1
   FROM
   (
      SELECT
         as_agg_64ed3897_q1_t67.d_catalog_sales_price_tie_c11 AS d_catalog_sales_pr_c74,
         as_agg_64ed3897_q1_t67.d_customer_state_c12 AS d_customer_state_c_c68,
         as_agg_64ed3897_q1_t67.d_customer_zip_code_c13 AS d_customer_zip_cod_c70,
         as_agg_64ed3897_q1_t67.key_c4 AS key_c4_c69,
         as_agg_64ed3897_q1_t67.m_cs_sales_price_sum_c14 AS m_cs_sales_price_s_c72,
         as_agg_64ed3897_q1_t67.sold_calendar_year_c9 AS sold_calendar_year_c71,
         as_agg_64ed3897_q1_t67.sold_d_quarter_of_year_c10 AS sold_d_quarter_of__c73
      FROM
         `benchmark-251817`.aggregates.as_agg_64ed3897_q15 AS as_agg_64ed3897_q1_t67
      WHERE
         as_agg_64ed3897_q1_t67.sold_d_quarter_of_year_c10 = 1
      AND
      (
            as_agg_64ed3897_q1_t67.d_customer_zip_code_c13 IN ('80348', '81792', '83405', '85392', '85460', '85669', '86197', '86475', '88274')
         OR
            as_agg_64ed3897_q1_t67.d_customer_state_c12 IN ('CA', 'GA', 'WA')
         OR
            as_agg_64ed3897_q1_t67.d_catalog_sales_price_tie_c11 = 'More than 500' )
      AND
         as_agg_64ed3897_q1_t67.sold_calendar_year_c9 = 2001
   ) AS t_75
   WHERE
      true
   GROUP BY
      1,
      3
) AS t_77
WHERE
   t_77.sum_m_cs_sales_pri_gbakc3 IS NOT NULL
ORDER BY
   1 ASC
LIMIT 100

-- Q26
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_75d20806_q7_q26`
(
  key_c1 STRING,
  key_c2 INT64,
  key_c3 STRING,
  key_c4 STRING,
  key_c5 STRING,
  key_c6 STRING,
  key_c7 STRING,
  key_c8 STRING,
  key_c9 STRING,
  key_c10 STRING,
  key_c11 STRING,
  key_c12 STRING,
  key_c13 STRING,
  sold_calendar_year_c14 INT64,
  d_cd_education_status_c15 STRING,
  d_cd_gender_c16 STRING,
  d_cd_marital_status_c17 STRING,
  d_channel_email_c18 STRING,
  d_channel_event_c19 STRING,
  d_product_item_id_c20 STRING,
  sumattrname_m_ss_quantity_c21 INT64,
  countattrname_m_ss_quanti_c22 INT64,
  sumattrname_m_catalog_sal_c23 NUMERIC,
  countattrname_m_catalog_s_c24 INT64,
  sumattrname_m_catalog_sal_c25 NUMERIC,
  countattrname_m_catalog_s_c26 INT64,
  sumattrname_m_catalog_sal_c27 INT64,
  countattrname_m_catalog_s_c28 INT64,
  sumattrname_m_catalog_sal_c29 NUMERIC,
  countattrname_m_catalog_s_c30 INT64,
  sumattrname_m_ss_coupon_a_c31 NUMERIC,
  countattrname_m_ss_coupon_c32 INT64,
  sumattrname_m_ss_list_pri_c33 NUMERIC,
  countattrname_m_ss_list_p_c34 INT64,
  sumattrname_m_ss_sales_pr_c35 NUMERIC,
  countattrname_m_ss_sales__c36 INT64
);
-- AtScale Agg Creation Query
SELECT
/* queryId=60f4d86c-7715-430f-8bac-3fd28b725b61 */
   t_1073.key_c1 AS key_c1,
   t_1073.key_c2 AS key_c2,
   t_1073.key_c3 AS key_c3,
   t_1073.key_c4 AS key_c4,
   t_1073.key_c5 AS key_c5,
   t_1073.key_c6 AS key_c6,
   t_1073.key_c7 AS key_c7,
   t_1073.key_c8 AS key_c8,
   t_1073.key_c9 AS key_c9,
   t_1073.key_c10 AS key_c10,
   t_1073.key_c11 AS key_c11,
   t_1073.key_c12 AS key_c12,
   t_1073.key_c13 AS key_c13,
   t_1073.sold_calendar_year_c14 AS sold_calendar_year_c14,
   t_1073.d_cd_education_status_c15 AS d_cd_education_status_c15,
   t_1073.d_cd_gender_c16 AS d_cd_gender_c16,
   t_1073.d_cd_marital_status_c17 AS d_cd_marital_status_c17,
   t_1073.d_channel_email_c18 AS d_channel_email_c18,
   t_1073.d_channel_event_c19 AS d_channel_event_c19,
   t_1073.d_product_item_id_c20 AS d_product_item_id_c20,
   MIN(t_1073.sumattrname_m_ss_quantity_c21) AS sumattrname_m_ss_quantity_c21,
   MIN(t_1073.countattrname_m_ss_quanti_c22) AS countattrname_m_ss_quanti_c22,
   MIN(t_1073.sumattrname_m_catalog_sal_c23) AS sumattrname_m_catalog_sal_c23,
   MIN(t_1073.countattrname_m_catalog_s_c24) AS countattrname_m_catalog_s_c24,
   MIN(t_1073.sumattrname_m_catalog_sal_c25) AS sumattrname_m_catalog_sal_c25,
   MIN(t_1073.countattrname_m_catalog_s_c26) AS countattrname_m_catalog_s_c26,
   MIN(t_1073.sumattrname_m_catalog_sal_c27) AS sumattrname_m_catalog_sal_c27,
   MIN(t_1073.countattrname_m_catalog_s_c28) AS countattrname_m_catalog_s_c28,
   MIN(t_1073.sumattrname_m_catalog_sal_c29) AS sumattrname_m_catalog_sal_c29,
   MIN(t_1073.countattrname_m_catalog_s_c30) AS countattrname_m_catalog_s_c30,
   MIN(t_1073.sumattrname_m_ss_coupon_a_c31) AS sumattrname_m_ss_coupon_a_c31,
   MIN(t_1073.countattrname_m_ss_coupon_c32) AS countattrname_m_ss_coupon_c32,
   MIN(t_1073.sumattrname_m_ss_list_pri_c33) AS sumattrname_m_ss_list_pri_c33,
   MIN(t_1073.countattrname_m_ss_list_p_c34) AS countattrname_m_ss_list_p_c34,
   MIN(t_1073.sumattrname_m_ss_sales_pr_c35) AS sumattrname_m_ss_sales_pr_c35,
   MIN(t_1073.countattrname_m_ss_sales__c36) AS countattrname_m_ss_sales__c36
FROM
(
      SELECT
         t_569.p_channel_email_c567 AS key_c1,
         date_dim_t564.d_year AS key_c2,
         t_569.p_channel_event_c568 AS key_c3,
         t_569.p_channel_email_c567 AS key_c4,
         item_t562.i_item_id AS key_c5,
         t_569.p_channel_event_c568 AS key_c6,
         customer_demograph_t563.cd_marital_status AS key_c7,
         customer_demograph_t563.cd_gender AS key_c8,
         customer_demograph_t563.cd_education_status AS key_c9,
         customer_demograph_t563.cd_marital_status AS key_c10,
         item_t562.i_item_id AS key_c11,
         customer_demograph_t563.cd_gender AS key_c12,
         customer_demograph_t563.cd_education_status AS key_c13,
         date_dim_t564.d_year AS sold_calendar_year_c14,
         customer_demograph_t563.cd_education_status AS d_cd_education_status_c15,
         customer_demograph_t563.cd_gender AS d_cd_gender_c16,
         customer_demograph_t563.cd_marital_status AS d_cd_marital_status_c17,
         t_569.p_channel_email_c567 AS d_channel_email_c18,
         t_569.p_channel_event_c568 AS d_channel_event_c19,
         item_t562.i_item_id AS d_product_item_id_c20,
         SAFE_CAST(SUM(store_sales_t561.ss_quantity) AS INT64) AS sumattrname_m_ss_quantity_c21,
         SAFE_CAST(COUNT(store_sales_t561.ss_quantity) AS INT64) AS countattrname_m_ss_quanti_c22,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_catalog_sal_c23,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_catalog_s_c24,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_catalog_sal_c25,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_catalog_s_c26,
         SAFE_CAST(NULL AS INT64) AS sumattrname_m_catalog_sal_c27,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_catalog_s_c28,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_catalog_sal_c29,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_catalog_s_c30,
         SAFE_CAST(SUM(store_sales_t561.ss_coupon_amt) AS NUMERIC) AS sumattrname_m_ss_coupon_a_c31,
         SAFE_CAST(COUNT(store_sales_t561.ss_coupon_amt) AS INT64) AS countattrname_m_ss_coupon_c32,
         SAFE_CAST(SUM(store_sales_t561.ss_list_price) AS NUMERIC) AS sumattrname_m_ss_list_pri_c33,
         SAFE_CAST(COUNT(store_sales_t561.ss_list_price) AS INT64) AS countattrname_m_ss_list_p_c34,
         SAFE_CAST(SUM(store_sales_t561.ss_sales_price) AS NUMERIC) AS sumattrname_m_ss_sales_pr_c35,
         SAFE_CAST(COUNT(store_sales_t561.ss_sales_price) AS INT64) AS countattrname_m_ss_sales__c36
      FROM
         `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t561
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t562
      ON
         store_sales_t561.ss_item_sk = item_t562.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_demographics AS customer_demograph_t563
      ON
         store_sales_t561.ss_cdemo_sk = customer_demograph_t563.cd_demo_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t564
      ON
         store_sales_t561.ss_sold_date_sk = date_dim_t564.d_date_sk
      JOIN
      (
         SELECT
            promotion_t565.p_channel_email AS p_channel_email_c567,
            promotion_t565.p_channel_event AS p_channel_event_c568,
            promotion_t565.p_promo_sk AS p_promo_sk_c566
         FROM
            `benchmark-251817`.TPCDS_10TB.promotion AS promotion_t565
         WHERE
            true
         GROUP BY
            1,
            2,
            3
      ) AS t_569
      ON
         store_sales_t561.ss_promo_sk = t_569.p_promo_sk_c566
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20
   UNION ALL
      SELECT
         t_839.p_channel_email_c837 AS key_c1,
         date_dim_t834.d_year AS key_c2,
         t_839.p_channel_event_c838 AS key_c3,
         t_839.p_channel_email_c837 AS key_c4,
         item_t832.i_item_id AS key_c5,
         t_839.p_channel_event_c838 AS key_c6,
         customer_demograph_t833.cd_marital_status AS key_c7,
         customer_demograph_t833.cd_gender AS key_c8,
         customer_demograph_t833.cd_education_status AS key_c9,
         customer_demograph_t833.cd_marital_status AS key_c10,
         item_t832.i_item_id AS key_c11,
         customer_demograph_t833.cd_gender AS key_c12,
         customer_demograph_t833.cd_education_status AS key_c13,
         date_dim_t834.d_year AS sold_calendar_year_c14,
         customer_demograph_t833.cd_education_status AS d_cd_education_status_c15,
         customer_demograph_t833.cd_gender AS d_cd_gender_c16,
         customer_demograph_t833.cd_marital_status AS d_cd_marital_status_c17,
         t_839.p_channel_email_c837 AS d_channel_email_c18,
         t_839.p_channel_event_c838 AS d_channel_event_c19,
         item_t832.i_item_id AS d_product_item_id_c20,
         SAFE_CAST(NULL AS INT64) AS sumattrname_m_ss_quantity_c21,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_ss_quanti_c22,
         SAFE_CAST(SUM(catalog_sales_t831.cs_coupon_amt) AS NUMERIC) AS sumattrname_m_catalog_sal_c23,
         SAFE_CAST(COUNT(catalog_sales_t831.cs_coupon_amt) AS INT64) AS countattrname_m_catalog_s_c24,
         SAFE_CAST(SUM(catalog_sales_t831.cs_list_price) AS NUMERIC) AS sumattrname_m_catalog_sal_c25,
         SAFE_CAST(COUNT(catalog_sales_t831.cs_list_price) AS INT64) AS countattrname_m_catalog_s_c26,
         SAFE_CAST(SUM(catalog_sales_t831.cs_quantity) AS INT64) AS sumattrname_m_catalog_sal_c27,
         SAFE_CAST(COUNT(catalog_sales_t831.cs_quantity) AS INT64) AS countattrname_m_catalog_s_c28,
         SAFE_CAST(SUM(catalog_sales_t831.cs_sales_price) AS NUMERIC) AS sumattrname_m_catalog_sal_c29,
         SAFE_CAST(COUNT(catalog_sales_t831.cs_sales_price) AS INT64) AS countattrname_m_catalog_s_c30,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_ss_coupon_a_c31,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_ss_coupon_c32,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_ss_list_pri_c33,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_ss_list_p_c34,
         SAFE_CAST(NULL AS NUMERIC) AS sumattrname_m_ss_sales_pr_c35,
         SAFE_CAST(NULL AS INT64) AS countattrname_m_ss_sales__c36
      FROM
         `benchmark-251817`.TPCDS_10TB.catalog_sales AS catalog_sales_t831
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t832
      ON
         catalog_sales_t831.cs_item_sk = item_t832.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_demographics AS customer_demograph_t833
      ON
         catalog_sales_t831.cs_bill_cdemo_sk = customer_demograph_t833.cd_demo_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t834
      ON
         catalog_sales_t831.cs_sold_date_sk = date_dim_t834.d_date_sk
      JOIN
      (
         SELECT
            promotion_t835.p_channel_email AS p_channel_email_c837,
            promotion_t835.p_channel_event AS p_channel_event_c838,
            promotion_t835.p_promo_sk AS p_promo_sk_c836
         FROM
            `benchmark-251817`.TPCDS_10TB.promotion AS promotion_t835
         WHERE
            true
         GROUP BY
            1,
            2,
            3
      ) AS t_839
      ON
         catalog_sales_t831.cs_promo_sk = t_839.p_promo_sk_c836
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20
) AS t_1073
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
   11,
   12,
   13,
   14,
   15,
   16,
   17,
   18,
   19,
   20
-- AtScale Generated User Query
SELECT
/* queryId=fdbec1bb-9b05-4cd4-8ced-1b6732b3441b */
   t_230.d_product_item_id_gbakc2 AS d_product_item_id,
   t_230.avg_m_catalog_sale_gbakc3 AS avg_m_catalog_sales_quantity_sold_avg_ok,
   t_230.avg_m_catalog_sale_gbakc4 AS avg_m_catalog_sales_list_price_avg_ok,
   t_230.sum_m_catalog_sale_gbakc5 AS sum_m_catalog_sales_coupon_amount_avg_ok,
   t_230.avg_m_catalog_sale_gbakc6 AS avg_m_catalog_sales_sales_price_avg_ok
FROM
(
   SELECT
      t_180.d_product_item_id__c178 AS d_product_item_id_gbakc2,
      CASE WHEN SUM(t_180.countattrname_m_ca_c171) = 0 THEN NULL ELSE (SUM(t_180.sumattrname_m_cata_c169) / SUM(t_180.countattrname_m_ca_c171)) END AS avg_m_catalog_sale_gbakc3,
      CASE WHEN SUM(t_180.countattrname_m_ca_c164) = 0 THEN NULL ELSE (SUM(t_180.sumattrname_m_cata_c179) / SUM(t_180.countattrname_m_ca_c164)) END AS avg_m_catalog_sale_gbakc4,
      CASE WHEN SUM(t_180.countattrname_m_ca_c177) = 0 THEN NULL ELSE (SUM(t_180.sumattrname_m_cata_c174) / SUM(t_180.countattrname_m_ca_c177)) END AS sum_m_catalog_sale_gbakc5,
      CASE WHEN SUM(t_180.countattrname_m_ca_c175) = 0 THEN NULL ELSE (SUM(t_180.sumattrname_m_cata_c166) / SUM(t_180.countattrname_m_ca_c175)) END AS avg_m_catalog_sale_gbakc6,
      t_180.key_c11_c173 AS d_product_item_id_gbakc1
   FROM
   (
      SELECT
         as_agg_75d20806_q7_t163.countattrname_m_catalog_s_c26 AS countattrname_m_ca_c164,
         as_agg_75d20806_q7_t163.countattrname_m_catalog_s_c28 AS countattrname_m_ca_c171,
         as_agg_75d20806_q7_t163.countattrname_m_catalog_s_c30 AS countattrname_m_ca_c175,
         as_agg_75d20806_q7_t163.countattrname_m_catalog_s_c24 AS countattrname_m_ca_c177,
         as_agg_75d20806_q7_t163.d_cd_education_status_c15 AS d_cd_education_sta_c165,
         as_agg_75d20806_q7_t163.d_cd_gender_c16 AS d_cd_gender_c16_c170,
         as_agg_75d20806_q7_t163.d_cd_marital_status_c17 AS d_cd_marital_statu_c167,
         as_agg_75d20806_q7_t163.d_channel_email_c18 AS d_channel_email_c1_c168,
         as_agg_75d20806_q7_t163.d_channel_event_c19 AS d_channel_event_c1_c176,
         as_agg_75d20806_q7_t163.d_product_item_id_c20 AS d_product_item_id__c178,
         as_agg_75d20806_q7_t163.key_c11 AS key_c11_c173,
         as_agg_75d20806_q7_t163.sold_calendar_year_c14 AS sold_calendar_year_c172,
         as_agg_75d20806_q7_t163.sumattrname_m_catalog_sal_c29 AS sumattrname_m_cata_c166,
         as_agg_75d20806_q7_t163.sumattrname_m_catalog_sal_c27 AS sumattrname_m_cata_c169,
         as_agg_75d20806_q7_t163.sumattrname_m_catalog_sal_c23 AS sumattrname_m_cata_c174,
         as_agg_75d20806_q7_t163.sumattrname_m_catalog_sal_c25 AS sumattrname_m_cata_c179
      FROM
         `benchmark-251817`.aggregates.as_agg_75d20806_q7_q26 AS as_agg_75d20806_q7_t163
      WHERE
         as_agg_75d20806_q7_t163.d_channel_event_c19 = 'N'
      AND
         as_agg_75d20806_q7_t163.d_channel_email_c18 = 'N'
      AND
         as_agg_75d20806_q7_t163.d_cd_marital_status_c17 = 'M'
      AND
         as_agg_75d20806_q7_t163.d_cd_gender_c16 = 'M'
      AND
         as_agg_75d20806_q7_t163.d_cd_education_status_c15 = 'College'
      AND
         as_agg_75d20806_q7_t163.d_product_item_id_c20 IS NOT NULL
      AND
         as_agg_75d20806_q7_t163.sold_calendar_year_c14 = 2000
   ) AS t_180
   WHERE
      true
   GROUP BY
      1,
      6
) AS t_230
ORDER BY
   1 ASC
LIMIT 100

-- Q31
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_0e4524c2_q31`
(
  key_c1 STRING,
  key_c2 INT64,
  key_c3 STRING,
  key_c4 STRING,
  key_c5 STRING,
  sold_calendar_quarter_c6 STRING,
  sold_calendar_year_week_c7 INT64,
  sold_d_ca_county_c8 STRING,
  m_ss_ext_sales_price_sum_c9 NUMERIC,
  m_ss_ext_sales_price_sum_c10 NUMERIC,
  m_ss_ext_sales_price_sum_c11 NUMERIC,
  m_ws_ext_sales_price_sum_c12 NUMERIC,
  m_ws_ext_sales_price_sum_c13 NUMERIC,
  m_ws_ext_sales_price_sum_c14 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=6e7f2d93-40ec-48e3-9067-cd8973a90601 */
   t_313.key_c1 AS key_c1,
   t_313.key_c2 AS key_c2,
   t_313.key_c3 AS key_c3,
   t_313.key_c4 AS key_c4,
   t_313.key_c5 AS key_c5,
   t_313.sold_calendar_quarter_c6 AS sold_calendar_quarter_c6,
   t_313.sold_calendar_year_week_c7 AS sold_calendar_year_week_c7,
   t_313.sold_d_ca_county_c8 AS sold_d_ca_county_c8,
   MIN(t_313.m_ss_ext_sales_price_sum_c9) AS m_ss_ext_sales_price_sum_c9,
   MIN(t_313.m_ss_ext_sales_price_sum_c10) AS m_ss_ext_sales_price_sum_c10,
   MIN(t_313.m_ss_ext_sales_price_sum_c11) AS m_ss_ext_sales_price_sum_c11,
   MIN(t_313.m_ws_ext_sales_price_sum_c12) AS m_ws_ext_sales_price_sum_c12,
   MIN(t_313.m_ws_ext_sales_price_sum_c13) AS m_ws_ext_sales_price_sum_c13,
   MIN(t_313.m_ws_ext_sales_price_sum_c14) AS m_ws_ext_sales_price_sum_c14
FROM
(
      SELECT
         customer_address_t221.ca_county AS key_c1,
         date_dim_t222.d_year AS key_c2,
         CONCAT(SUBSTR(CAST(date_dim_t222.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t222.D_QOY AS STRING), 2, '0'),'-01') AS key_c3,
         customer_address_t221.ca_county AS key_c4,
         CONCAT(SUBSTR(CAST(date_dim_t222.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t222.D_QOY AS STRING), 2, '0'),'-01') AS key_c5,
         date_dim_t222.d_quarter_name AS sold_calendar_quarter_c6,
         date_dim_t222.d_year AS sold_calendar_year_week_c7,
         customer_address_t221.ca_county AS sold_d_ca_county_c8,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c9,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c10,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c11,
         SAFE_CAST(SUM(web_sales_t220.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c12,
         SAFE_CAST(MIN(web_sales_t220.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c13,
         SAFE_CAST(MAX(web_sales_t220.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c14
      FROM
         `benchmark-251817`.TPCDS_10TB.web_sales AS web_sales_t220
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t221
      ON
         web_sales_t220.ws_bill_addr_sk = customer_address_t221.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t222
      ON
         web_sales_t220.ws_sold_date_sk = date_dim_t222.d_date_sk
      WHERE
         true
      GROUP BY
         1,
         2,
         3,
         4,
         5,
         6,
         7,
         8
   UNION ALL
      SELECT
         customer_address_t273.ca_county AS key_c1,
         date_dim_t274.d_year AS key_c2,
         CONCAT(SUBSTR(CAST(date_dim_t274.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t274.D_QOY AS STRING), 2, '0'),'-01') AS key_c3,
         customer_address_t273.ca_county AS key_c4,
         CONCAT(SUBSTR(CAST(date_dim_t274.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t274.D_QOY AS STRING), 2, '0'),'-01') AS key_c5,
         date_dim_t274.d_quarter_name AS sold_calendar_quarter_c6,
         date_dim_t274.d_year AS sold_calendar_year_week_c7,
         customer_address_t273.ca_county AS sold_d_ca_county_c8,
         SAFE_CAST(SUM(store_sales_t272.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c9,
         SAFE_CAST(MIN(store_sales_t272.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c10,
         SAFE_CAST(MAX(store_sales_t272.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c11,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c12,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c13,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c14
      FROM
         `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t272
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t273
      ON
         store_sales_t272.ss_addr_sk = customer_address_t273.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t274
      ON
         store_sales_t272.ss_sold_date_sk = date_dim_t274.d_date_sk
      WHERE
         true
      GROUP BY
         1,
         2,
         3,
         4,
         5,
         6,
         7,
         8
) AS t_313
GROUP BY
   1,
   2,
   3,
   4,
   5,
   6,
   7,
   8
-- AtScale Generated User Query
SELECT
/* queryId=08dc55de-1d94-400b-a031-a28a200b0e4c */
   t_695.sold_calendar_quar_gbakc3 AS sold_calendar_quarter,
   t_695.sold_d_ca_county_gbakc4 AS sold_d_ca_county,
   t_695.sum_store_sales_in_gbakc5 AS sum_store_sales_increase_ok,
   t_695.sum_web_sales_incr_gbakc6 AS sum_web_sales_increase_ok
FROM
(
   SELECT
      t_635.sold_calendar_quar_gbakc3 AS sold_calendar_quar_gbakc3,
      t_635.sold_d_ca_county_gbakc4 AS sold_d_ca_county_gbakc4,
      CASE WHEN MIN(t_635.c_202) IS NULL THEN NULL ELSE CASE WHEN COALESCE(MIN(t_635.c_204), 0) = 0 THEN (SAFE_CAST('Infinity' AS FLOAT64) * SAFE_CAST(SIGN(MIN(t_635.c_206)) AS FLOAT64)) ELSE CASE WHEN MIN(t_635.c_204) = 0 THEN NULL ELSE (MIN(t_635.c_206) / MIN(t_635.c_204)) END END END AS sum_store_sales_in_gbakc5,
      CASE WHEN MIN(t_635.c_211) IS NULL THEN NULL ELSE CASE WHEN COALESCE(MIN(t_635.c_213), 0) = 0 THEN (SAFE_CAST('Infinity' AS FLOAT64) * SAFE_CAST(SIGN(MIN(t_635.c_215)) AS FLOAT64)) ELSE CASE WHEN MIN(t_635.c_213) = 0 THEN NULL ELSE (MIN(t_635.c_215) / MIN(t_635.c_213)) END END END AS sum_web_sales_incr_gbakc6,
      t_635.sold_calendar_quar_gbakc1 AS sold_calendar_quar_gbakc1,
      t_635.sold_d_ca_county_gbakc2 AS sold_d_ca_county_gbakc2
   FROM
   (
      SELECT
         t_634.sold_calendar_quar_gbakc3 AS sold_calendar_quar_gbakc3,
         t_634.sold_d_ca_county_gbakc4 AS sold_d_ca_county_gbakc4,
         MIN(t_634.c_202) AS c_202,
         MIN(t_634.c_204) AS c_204,
         MIN(t_634.c_206) AS c_206,
         MIN(t_634.c_211) AS c_211,
         MIN(t_634.c_213) AS c_213,
         MIN(t_634.c_215) AS c_215,
         t_634.sold_calendar_quar_gbakc1 AS sold_calendar_quar_gbakc1,
         t_634.sold_d_ca_county_gbakc2 AS sold_d_ca_county_gbakc2
      FROM
      (
            SELECT
               as_agg_0e4524c2_q3_t533.sold_calendar_quarter_c6 AS sold_calendar_quar_gbakc3,
               as_agg_0e4524c2_q3_t533.sold_d_ca_county_c8 AS sold_d_ca_county_gbakc4,
               SUM(as_agg_0e4524c2_q3_t533.m_ss_ext_sales_price_sum_c9) AS c_202,
               SAFE_CAST(NULL AS NUMERIC) AS c_204,
               SAFE_CAST(NULL AS NUMERIC) AS c_206,
               SUM(as_agg_0e4524c2_q3_t533.m_ws_ext_sales_price_sum_c12) AS c_211,
               SAFE_CAST(NULL AS NUMERIC) AS c_213,
               SAFE_CAST(NULL AS NUMERIC) AS c_215,
               as_agg_0e4524c2_q3_t533.key_c5 AS sold_calendar_quar_gbakc1,
               as_agg_0e4524c2_q3_t533.key_c4 AS sold_d_ca_county_gbakc2
            FROM
               `benchmark-251817`.aggregates.as_agg_0e4524c2_q31 AS as_agg_0e4524c2_q3_t533
            JOIN
            (
               SELECT
                  date_dim_t534.d_year AS d_year_c535
               FROM
                  `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t534
               WHERE
                  date_dim_t534.d_year = 2001
               GROUP BY
                  1
            ) AS t_536
            ON
               as_agg_0e4524c2_q3_t533.key_c2 = t_536.d_year_c535
            WHERE
               true
            GROUP BY
               1,
               2,
               9,
               10
         UNION ALL
            SELECT
               t_547.sold_calendar_quar_gbakc3 AS sold_calendar_quar_gbakc3,
               t_547.sold_d_ca_county_gbakc4 AS sold_d_ca_county_gbakc4,
               SAFE_CAST(NULL AS NUMERIC) AS c_202,
               SAFE_CAST(NULL AS NUMERIC) AS c_204,
               SAFE_CAST(NULL AS NUMERIC) AS c_206,
               SAFE_CAST(NULL AS NUMERIC) AS c_211,
               SAFE_CAST(NULL AS NUMERIC) AS c_213,
               MIN(t_547.c_215) AS c_215,
               t_547.sold_calendar_quar_gbakc1 AS sold_calendar_quar_gbakc1,
               t_547.sold_d_ca_county_gbakc2 AS sold_d_ca_county_gbakc2
            FROM
            (
               SELECT
                  as_agg_0e4524c2_q3_t542.sold_calendar_quarter_c6 AS sold_calendar_quar_gbakc3,
                  as_agg_0e4524c2_q3_t542.sold_d_ca_county_c8 AS sold_d_ca_county_gbakc4,
                  SUM(as_agg_0e4524c2_q3_t542.m_ws_ext_sales_price_sum_c12) AS c_215,
                  as_agg_0e4524c2_q3_t542.key_c5 AS sold_calendar_quar_gbakc1,
                  as_agg_0e4524c2_q3_t542.key_c4 AS sold_d_ca_county_gbakc2
               FROM
                  `benchmark-251817`.aggregates.as_agg_0e4524c2_q31 AS as_agg_0e4524c2_q3_t542
               JOIN
               (
                  SELECT
                     date_dim_t543.d_year AS d_year_c544
                  FROM
                     `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t543
                  WHERE
                     date_dim_t543.d_year = 2001
                  GROUP BY
                     1
               ) AS t_545
               ON
                  as_agg_0e4524c2_q3_t542.key_c2 = t_545.d_year_c544
               WHERE
                  true
               GROUP BY
                  1,
                  2,
                  4,
                  5
            ) AS t_547
            GROUP BY
               1,
               2,
               9,
               10
         UNION ALL
            SELECT
               t_611.sold_calendar_quar_gbakc3 AS sold_calendar_quar_gbakc3,
               t_611.sold_d_ca_county_gbakc4 AS sold_d_ca_county_gbakc4,
               SAFE_CAST(NULL AS NUMERIC) AS c_202,
               MIN(t_611.c_204) AS c_204,
               SAFE_CAST(NULL AS NUMERIC) AS c_206,
               SAFE_CAST(NULL AS NUMERIC) AS c_211,
               SAFE_CAST(NULL AS NUMERIC) AS c_213,
               SAFE_CAST(NULL AS NUMERIC) AS c_215,
               t_611.sold_calendar_quar_gbakc1 AS sold_calendar_quar_gbakc1,
               t_611.sold_d_ca_county_gbakc2 AS sold_d_ca_county_gbakc2
            FROM
            (
               SELECT
                  COALESCE(t_606.c_200, t_568.sold_calendar_quar_gbakc3) AS sold_calendar_quar_gbakc3,
                  t_568.sold_d_ca_county_gbakc4 AS sold_d_ca_county_gbakc4,
                  SAFE_CAST(NULL AS NUMERIC) AS c_202,
                  MIN(t_568.c_204) AS c_204,
                  SAFE_CAST(NULL AS NUMERIC) AS c_206,
                  SAFE_CAST(NULL AS NUMERIC) AS c_211,
                  SAFE_CAST(NULL AS NUMERIC) AS c_213,
                  SAFE_CAST(NULL AS NUMERIC) AS c_215,
                  COALESCE(t_606.c_279, t_568.sold_calendar_quar_gbakc1) AS sold_calendar_quar_gbakc1,
                  t_568.sold_d_ca_county_gbakc2 AS sold_d_ca_county_gbakc2,
                  COALESCE(t_606.c_269, t_568.c_272) AS c_272
               FROM
               (
                  SELECT
                     t_605.c_279 AS c_279,
                     t_605.c_284 AS c_284,
                     t_558.c_269 AS c_269,
                     t_558.c_200 AS c_200
                  FROM
                  (
                     SELECT
                        t_551.c_279 AS c_279,
                        t_555.c_282 AS c_284
                     FROM
                     (
                        SELECT
                           c_wfa696.c_279 AS c_279,
                           ROW_NUMBER() OVER (ORDER BY c_wfa696.c_277 ASC ) AS rn_c278,
                           c_wfa696.c_276 AS c_276,
                           c_wfa696.c_277 AS c_277
                        FROM
                        (
                           SELECT
                              CONCAT(SUBSTR(CAST(date_dim_t548.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t548.D_QOY AS STRING), 2, '0'),'-01') AS c_279,
                              date_dim_t548.d_quarter_name AS c_276,
                              CONCAT(SUBSTR(CAST(date_dim_t548.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t548.D_QOY AS STRING), 2, '0'),'-01') AS c_277
                           FROM
                              `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t548
                           WHERE
                              true
                           GROUP BY
                              1,
                              2,
                              3
                        ) AS c_wfa696
                        WHERE
                           true
                        GROUP BY
                           1,
                           3,
                           4
                     ) AS t_551
                     JOIN
                     (
                        SELECT
                           c_wfa697.c_282 AS c_282,
                           ROW_NUMBER() OVER (ORDER BY c_wfa697.c_280 ASC ) AS rn_c281,
                           c_wfa697.c_276 AS c_276,
                           c_wfa697.c_280 AS c_280
                        FROM
                        (
                           SELECT
                              CONCAT(SUBSTR(CAST(date_dim_t552.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t552.D_QOY AS STRING), 2, '0'),'-01') AS c_282,
                              date_dim_t552.d_quarter_name AS c_276,
                              CONCAT(SUBSTR(CAST(date_dim_t552.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t552.D_QOY AS STRING), 2, '0'),'-01') AS c_280
                           FROM
                              `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t552
                           WHERE
                              true
                           GROUP BY
                              1,
                              2,
                              3
                        ) AS c_wfa697
                        WHERE
                           true
                        GROUP BY
                           1,
                           3,
                           4
                     ) AS t_555
                     ON
                        (t_551.rn_c278 + SAFE_CAST(-1 AS INT64)) = t_555.rn_c281
                     GROUP BY
                        1,
                        2
                  ) AS t_605
                  JOIN
                  (
                     SELECT
                        CONCAT(SUBSTR(CAST(date_dim_t556.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t556.D_QOY AS STRING), 2, '0'),'-01') AS c_285,
                        date_dim_t556.d_year AS c_269,
                        CONCAT(SUBSTR(CAST(date_dim_t556.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t556.D_QOY AS STRING), 2, '0'),'-01') AS c_220,
                        date_dim_t556.d_quarter_name AS c_200
                     FROM
                        `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t556
                     WHERE
                        true
                     GROUP BY
                        1,
                        2,
                        3,
                        4
                  ) AS t_558
                  ON
                     t_605.c_279 = t_558.c_220
                  GROUP BY
                     1,
                     2,
                     3,
                     4
               ) AS t_606
               JOIN
               (
                  SELECT
                     as_agg_0e4524c2_q3_t563.sold_calendar_quarter_c6 AS sold_calendar_quar_gbakc3,
                     as_agg_0e4524c2_q3_t563.sold_d_ca_county_c8 AS sold_d_ca_county_gbakc4,
                     SUM(as_agg_0e4524c2_q3_t563.m_ss_ext_sales_price_sum_c9) AS c_204,
                     as_agg_0e4524c2_q3_t563.key_c5 AS sold_calendar_quar_gbakc1,
                     as_agg_0e4524c2_q3_t563.key_c4 AS sold_d_ca_county_gbakc2,
                     as_agg_0e4524c2_q3_t563.key_c5 AS c_292,
                     t_566.d_year_c565 AS c_272,
                     as_agg_0e4524c2_q3_t563.key_c5 AS c_273,
                     t_566.d_year_c565 AS c_293
                  FROM
                     `benchmark-251817`.aggregates.as_agg_0e4524c2_q31 AS as_agg_0e4524c2_q3_t563
                  JOIN
                  (
                     SELECT
                        date_dim_t564.d_year AS d_year_c565
                     FROM
                        `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t564
                     WHERE
                        true
                     GROUP BY
                        1
                  ) AS t_566
                  ON
                     as_agg_0e4524c2_q3_t563.key_c2 = t_566.d_year_c565
                  WHERE
                     true
                  GROUP BY
                     1,
                     2,
                     4,
                     5,
                     6,
                     7,
                     8,
                     9
               ) AS t_568
               ON
                  t_606.c_284 = t_568.sold_calendar_quar_gbakc1
               WHERE
                  COALESCE(t_606.c_269, t_568.c_272) = 2001
               GROUP BY
                  1,
                  2,
                  9,
                  10,
                  11
            ) AS t_611
            GROUP BY
               1,
               2,
               9,
               10
         UNION ALL
            SELECT
               t_578.sold_calendar_quar_gbakc3 AS sold_calendar_quar_gbakc3,
               t_578.sold_d_ca_county_gbakc4 AS sold_d_ca_county_gbakc4,
               SAFE_CAST(NULL AS NUMERIC) AS c_202,
               SAFE_CAST(NULL AS NUMERIC) AS c_204,
               MIN(t_578.c_206) AS c_206,
               SAFE_CAST(NULL AS NUMERIC) AS c_211,
               SAFE_CAST(NULL AS NUMERIC) AS c_213,
               SAFE_CAST(NULL AS NUMERIC) AS c_215,
               t_578.sold_calendar_quar_gbakc1 AS sold_calendar_quar_gbakc1,
               t_578.sold_d_ca_county_gbakc2 AS sold_d_ca_county_gbakc2
            FROM
            (
               SELECT
                  as_agg_0e4524c2_q3_t573.sold_calendar_quarter_c6 AS sold_calendar_quar_gbakc3,
                  as_agg_0e4524c2_q3_t573.sold_d_ca_county_c8 AS sold_d_ca_county_gbakc4,
                  SUM(as_agg_0e4524c2_q3_t573.m_ss_ext_sales_price_sum_c9) AS c_206,
                  as_agg_0e4524c2_q3_t573.key_c5 AS sold_calendar_quar_gbakc1,
                  as_agg_0e4524c2_q3_t573.key_c4 AS sold_d_ca_county_gbakc2
               FROM
                  `benchmark-251817`.aggregates.as_agg_0e4524c2_q31 AS as_agg_0e4524c2_q3_t573
               JOIN
               (
                  SELECT
                     date_dim_t574.d_year AS d_year_c575
                  FROM
                     `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t574
                  WHERE
                     date_dim_t574.d_year = 2001
                  GROUP BY
                     1
               ) AS t_576
               ON
                  as_agg_0e4524c2_q3_t573.key_c2 = t_576.d_year_c575
               WHERE
                  true
               GROUP BY
                  1,
                  2,
                  4,
                  5
            ) AS t_578
            GROUP BY
               1,
               2,
               9,
               10
         UNION ALL
            SELECT
               t_628.sold_calendar_quar_gbakc3 AS sold_calendar_quar_gbakc3,
               t_628.sold_d_ca_county_gbakc4 AS sold_d_ca_county_gbakc4,
               SAFE_CAST(NULL AS NUMERIC) AS c_202,
               SAFE_CAST(NULL AS NUMERIC) AS c_204,
               SAFE_CAST(NULL AS NUMERIC) AS c_206,
               SAFE_CAST(NULL AS NUMERIC) AS c_211,
               MIN(t_628.c_213) AS c_213,
               SAFE_CAST(NULL AS NUMERIC) AS c_215,
               t_628.sold_calendar_quar_gbakc1 AS sold_calendar_quar_gbakc1,
               t_628.sold_d_ca_county_gbakc2 AS sold_d_ca_county_gbakc2
            FROM
            (
               SELECT
                  COALESCE(t_623.c_200, t_599.sold_calendar_quar_gbakc3) AS sold_calendar_quar_gbakc3,
                  t_599.sold_d_ca_county_gbakc4 AS sold_d_ca_county_gbakc4,
                  SAFE_CAST(NULL AS NUMERIC) AS c_202,
                  SAFE_CAST(NULL AS NUMERIC) AS c_204,
                  SAFE_CAST(NULL AS NUMERIC) AS c_206,
                  SAFE_CAST(NULL AS NUMERIC) AS c_211,
                  MIN(t_599.c_213) AS c_213,
                  SAFE_CAST(NULL AS NUMERIC) AS c_215,
                  COALESCE(t_623.c_350, t_599.sold_calendar_quar_gbakc1) AS sold_calendar_quar_gbakc1,
                  t_599.sold_d_ca_county_gbakc2 AS sold_d_ca_county_gbakc2,
                  COALESCE(t_623.c_340, t_599.c_343) AS c_343
               FROM
               (
                  SELECT
                     t_622.c_350 AS c_350,
                     t_622.c_355 AS c_355,
                     t_589.c_340 AS c_340,
                     t_589.c_200 AS c_200
                  FROM
                  (
                     SELECT
                        t_582.c_350 AS c_350,
                        t_586.c_353 AS c_355
                     FROM
                     (
                        SELECT
                           c_wfa698.c_350 AS c_350,
                           ROW_NUMBER() OVER (ORDER BY c_wfa698.c_348 ASC ) AS rn_c349,
                           c_wfa698.c_347 AS c_347,
                           c_wfa698.c_348 AS c_348
                        FROM
                        (
                           SELECT
                              CONCAT(SUBSTR(CAST(date_dim_t579.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t579.D_QOY AS STRING), 2, '0'),'-01') AS c_350,
                              date_dim_t579.d_quarter_name AS c_347,
                              CONCAT(SUBSTR(CAST(date_dim_t579.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t579.D_QOY AS STRING), 2, '0'),'-01') AS c_348
                           FROM
                              `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t579
                           WHERE
                              true
                           GROUP BY
                              1,
                              2,
                              3
                        ) AS c_wfa698
                        WHERE
                           true
                        GROUP BY
                           1,
                           3,
                           4
                     ) AS t_582
                     JOIN
                     (
                        SELECT
                           c_wfa699.c_353 AS c_353,
                           ROW_NUMBER() OVER (ORDER BY c_wfa699.c_351 ASC ) AS rn_c352,
                           c_wfa699.c_347 AS c_347,
                           c_wfa699.c_351 AS c_351
                        FROM
                        (
                           SELECT
                              CONCAT(SUBSTR(CAST(date_dim_t583.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t583.D_QOY AS STRING), 2, '0'),'-01') AS c_353,
                              date_dim_t583.d_quarter_name AS c_347,
                              CONCAT(SUBSTR(CAST(date_dim_t583.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t583.D_QOY AS STRING), 2, '0'),'-01') AS c_351
                           FROM
                              `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t583
                           WHERE
                              true
                           GROUP BY
                              1,
                              2,
                              3
                        ) AS c_wfa699
                        WHERE
                           true
                        GROUP BY
                           1,
                           3,
                           4
                     ) AS t_586
                     ON
                        (t_582.rn_c349 + SAFE_CAST(-1 AS INT64)) = t_586.rn_c352
                     GROUP BY
                        1,
                        2
                  ) AS t_622
                  JOIN
                  (
                     SELECT
                        CONCAT(SUBSTR(CAST(date_dim_t587.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t587.D_QOY AS STRING), 2, '0'),'-01') AS c_356,
                        date_dim_t587.d_year AS c_340,
                        CONCAT(SUBSTR(CAST(date_dim_t587.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t587.D_QOY AS STRING), 2, '0'),'-01') AS c_220,
                        date_dim_t587.d_quarter_name AS c_200
                     FROM
                        `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t587
                     WHERE
                        true
                     GROUP BY
                        1,
                        2,
                        3,
                        4
                  ) AS t_589
                  ON
                     t_622.c_350 = t_589.c_220
                  GROUP BY
                     1,
                     2,
                     3,
                     4
               ) AS t_623
               JOIN
               (
                  SELECT
                     as_agg_0e4524c2_q3_t594.sold_calendar_quarter_c6 AS sold_calendar_quar_gbakc3,
                     as_agg_0e4524c2_q3_t594.sold_d_ca_county_c8 AS sold_d_ca_county_gbakc4,
                     SUM(as_agg_0e4524c2_q3_t594.m_ws_ext_sales_price_sum_c12) AS c_213,
                     as_agg_0e4524c2_q3_t594.key_c5 AS sold_calendar_quar_gbakc1,
                     as_agg_0e4524c2_q3_t594.key_c4 AS sold_d_ca_county_gbakc2,
                     as_agg_0e4524c2_q3_t594.key_c5 AS c_363,
                     t_597.d_year_c596 AS c_343,
                     as_agg_0e4524c2_q3_t594.key_c5 AS c_344,
                     t_597.d_year_c596 AS c_364
                  FROM
                     `benchmark-251817`.aggregates.as_agg_0e4524c2_q31 AS as_agg_0e4524c2_q3_t594
                  JOIN
                  (
                     SELECT
                        date_dim_t595.d_year AS d_year_c596
                     FROM
                        `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t595
                     WHERE
                        true
                     GROUP BY
                        1
                  ) AS t_597
                  ON
                     as_agg_0e4524c2_q3_t594.key_c2 = t_597.d_year_c596
                  WHERE
                     true
                  GROUP BY
                     1,
                     2,
                     4,
                     5,
                     6,
                     7,
                     8,
                     9
               ) AS t_599
               ON
                  t_623.c_355 = t_599.sold_calendar_quar_gbakc1
               WHERE
                  COALESCE(t_623.c_340, t_599.c_343) = 2001
               GROUP BY
                  1,
                  2,
                  9,
                  10,
                  11
            ) AS t_628
            GROUP BY
               1,
               2,
               9,
               10
      ) AS t_634
      GROUP BY
         1,
         2,
         9,
         10
   ) AS t_635
   GROUP BY
      1,
      2,
      5,
      6
) AS t_695

-- Q33
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_2baaa92f_q33`
(
  key_c1 NUMERIC,
  key_c2 INT64,
  key_c3 INT64,
  key_c4 NUMERIC,
  key_c5 INT64,
  key_c6 INT64,
  key_c7 STRING,
  key_c8 INT64,
  i_category_c9 STRING,
  sold_calendar_year_week_c10 INT64,
  sold_d_customer_gmt_offse_c11 NUMERIC,
  sold_d_month_of_year_c12 INT64,
  d_product_manufacturer_id_c13 INT64,
  m_cs_ext_sales_price_sum_c14 NUMERIC,
  m_cs_ext_sales_price_sum_c15 NUMERIC,
  m_cs_ext_sales_price_sum_c16 NUMERIC,
  m_ss_ext_sales_price_sum_c17 NUMERIC,
  m_ss_ext_sales_price_sum_c18 NUMERIC,
  m_ss_ext_sales_price_sum_c19 NUMERIC,
  m_ws_ext_sales_price_sum_c20 NUMERIC,
  m_ws_ext_sales_price_sum_c21 NUMERIC,
  m_ws_ext_sales_price_sum_c22 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=986d57ca-5b85-4106-8184-b7e093e1da29 */
   t_611.key_c1 AS key_c1,
   t_611.key_c2 AS key_c2,
   t_611.key_c3 AS key_c3,
   t_611.key_c4 AS key_c4,
   t_611.key_c5 AS key_c5,
   t_611.key_c6 AS key_c6,
   t_611.key_c7 AS key_c7,
   t_611.key_c8 AS key_c8,
   t_611.i_category_c9 AS i_category_c9,
   t_611.sold_calendar_year_week_c10 AS sold_calendar_year_week_c10,
   t_611.sold_d_customer_gmt_offse_c11 AS sold_d_customer_gmt_offse_c11,
   t_611.sold_d_month_of_year_c12 AS sold_d_month_of_year_c12,
   t_611.d_product_manufacturer_id_c13 AS d_product_manufacturer_id_c13,
   MIN(t_611.m_cs_ext_sales_price_sum_c14) AS m_cs_ext_sales_price_sum_c14,
   MIN(t_611.m_cs_ext_sales_price_sum_c15) AS m_cs_ext_sales_price_sum_c15,
   MIN(t_611.m_cs_ext_sales_price_sum_c16) AS m_cs_ext_sales_price_sum_c16,
   MIN(t_611.m_ss_ext_sales_price_sum_c17) AS m_ss_ext_sales_price_sum_c17,
   MIN(t_611.m_ss_ext_sales_price_sum_c18) AS m_ss_ext_sales_price_sum_c18,
   MIN(t_611.m_ss_ext_sales_price_sum_c19) AS m_ss_ext_sales_price_sum_c19,
   MIN(t_611.m_ws_ext_sales_price_sum_c20) AS m_ws_ext_sales_price_sum_c20,
   MIN(t_611.m_ws_ext_sales_price_sum_c21) AS m_ws_ext_sales_price_sum_c21,
   MIN(t_611.m_ws_ext_sales_price_sum_c22) AS m_ws_ext_sales_price_sum_c22
FROM
(
      SELECT
         customer_address_t413.ca_gmt_offset AS key_c1,
         date_dim_t414.d_moy AS key_c2,
         item_t412.i_manufact_id AS key_c3,
         customer_address_t413.ca_gmt_offset AS key_c4,
         date_dim_t414.d_year AS key_c5,
         date_dim_t414.d_moy AS key_c6,
         item_t412.i_category AS key_c7,
         item_t412.i_manufact_id AS key_c8,
         item_t412.i_category AS i_category_c9,
         date_dim_t414.d_year AS sold_calendar_year_week_c10,
         customer_address_t413.ca_gmt_offset AS sold_d_customer_gmt_offse_c11,
         date_dim_t414.d_moy AS sold_d_month_of_year_c12,
         item_t412.i_manufact_id AS d_product_manufacturer_id_c13,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c14,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c15,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c16,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c17,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c18,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c19,
         SAFE_CAST(SUM(web_sales_t411.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c20,
         SAFE_CAST(MIN(web_sales_t411.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c21,
         SAFE_CAST(MAX(web_sales_t411.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c22
      FROM
         `benchmark-251817`.TPCDS_10TB.web_sales AS web_sales_t411
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t412
      ON
         web_sales_t411.ws_item_sk = item_t412.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t413
      ON
         web_sales_t411.ws_bill_addr_sk = customer_address_t413.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t414
      ON
         web_sales_t411.ws_sold_date_sk = date_dim_t414.d_date_sk
      WHERE
         true
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
         11,
         12,
         13
   UNION ALL
      SELECT
         customer_address_t485.ca_gmt_offset AS key_c1,
         date_dim_t486.d_moy AS key_c2,
         item_t484.i_manufact_id AS key_c3,
         customer_address_t485.ca_gmt_offset AS key_c4,
         date_dim_t486.d_year AS key_c5,
         date_dim_t486.d_moy AS key_c6,
         item_t484.i_category AS key_c7,
         item_t484.i_manufact_id AS key_c8,
         item_t484.i_category AS i_category_c9,
         date_dim_t486.d_year AS sold_calendar_year_week_c10,
         customer_address_t485.ca_gmt_offset AS sold_d_customer_gmt_offse_c11,
         date_dim_t486.d_moy AS sold_d_month_of_year_c12,
         item_t484.i_manufact_id AS d_product_manufacturer_id_c13,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c14,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c15,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c16,
         SAFE_CAST(SUM(store_sales_t483.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c17,
         SAFE_CAST(MIN(store_sales_t483.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c18,
         SAFE_CAST(MAX(store_sales_t483.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c19,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c20,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c21,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c22
      FROM
         `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t483
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t484
      ON
         store_sales_t483.ss_item_sk = item_t484.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t485
      ON
         store_sales_t483.ss_addr_sk = customer_address_t485.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t486
      ON
         store_sales_t483.ss_sold_date_sk = date_dim_t486.d_date_sk
      WHERE
         true
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
         11,
         12,
         13
   UNION ALL
      SELECT
         customer_address_t557.ca_gmt_offset AS key_c1,
         date_dim_t558.d_moy AS key_c2,
         item_t556.i_manufact_id AS key_c3,
         customer_address_t557.ca_gmt_offset AS key_c4,
         date_dim_t558.d_year AS key_c5,
         date_dim_t558.d_moy AS key_c6,
         item_t556.i_category AS key_c7,
         item_t556.i_manufact_id AS key_c8,
         item_t556.i_category AS i_category_c9,
         date_dim_t558.d_year AS sold_calendar_year_week_c10,
         customer_address_t557.ca_gmt_offset AS sold_d_customer_gmt_offse_c11,
         date_dim_t558.d_moy AS sold_d_month_of_year_c12,
         item_t556.i_manufact_id AS d_product_manufacturer_id_c13,
         SAFE_CAST(SUM(catalog_sales_t555.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c14,
         SAFE_CAST(MIN(catalog_sales_t555.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c15,
         SAFE_CAST(MAX(catalog_sales_t555.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c16,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c17,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c18,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c19,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c20,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c21,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c22
      FROM
         `benchmark-251817`.TPCDS_10TB.catalog_sales AS catalog_sales_t555
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t556
      ON
         catalog_sales_t555.cs_item_sk = item_t556.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t557
      ON
         catalog_sales_t555.cs_bill_addr_sk = customer_address_t557.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t558
      ON
         catalog_sales_t555.cs_sold_date_sk = date_dim_t558.d_date_sk
      WHERE
         true
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
         11,
         12,
         13
) AS t_611
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
   11,
   12,
   13
-- AtScale Generated User Query
SELECT
/* queryId=c0f3dc2a-7560-4f50-bd4a-22ef011185a4 */
   t_123.d_product_manufact_gbakc2 AS d_product_manufacturer_id,
   t_123.sum_total_ext_sale_gbakc3 AS sum_total__ext_sales_price_ok
FROM
(
   SELECT
      t_107.d_product_manufact_c100 AS d_product_manufact_gbakc2,
      CASE WHEN COALESCE(SUM(t_107.m_ss_ext_sales_pri_c106), SUM(t_107.m_ws_ext_sales_pri_c105), SUM(t_107.m_cs_ext_sales_pri_c103)) IS NULL THEN NULL ELSE ((COALESCE(SUM(t_107.m_ss_ext_sales_pri_c106), 0) + COALESCE(SUM(t_107.m_ws_ext_sales_pri_c105), 0)) + COALESCE(SUM(t_107.m_cs_ext_sales_pri_c103), 0)) END AS sum_total_ext_sale_gbakc3,
      t_107.key_c3_c98 AS d_product_manufact_gbakc1
   FROM
   (
      SELECT
         as_agg_2baaa92f_q3_t97.d_product_manufacturer_id_c13 AS d_product_manufact_c100,
         as_agg_2baaa92f_q3_t97.i_category_c9 AS i_category_c9_c102,
         as_agg_2baaa92f_q3_t97.key_c3 AS key_c3_c98,
         as_agg_2baaa92f_q3_t97.m_cs_ext_sales_price_sum_c14 AS m_cs_ext_sales_pri_c103,
         as_agg_2baaa92f_q3_t97.m_ss_ext_sales_price_sum_c17 AS m_ss_ext_sales_pri_c106,
         as_agg_2baaa92f_q3_t97.m_ws_ext_sales_price_sum_c20 AS m_ws_ext_sales_pri_c105,
         as_agg_2baaa92f_q3_t97.sold_calendar_year_week_c10 AS sold_calendar_year_c99,
         as_agg_2baaa92f_q3_t97.sold_d_customer_gmt_offse_c11 AS sold_d_customer_gm_c101,
         as_agg_2baaa92f_q3_t97.sold_d_month_of_year_c12 AS sold_d_month_of_ye_c104
      FROM
         `benchmark-251817`.aggregates.as_agg_2baaa92f_q33 AS as_agg_2baaa92f_q3_t97
      WHERE
         as_agg_2baaa92f_q3_t97.sold_d_month_of_year_c12 = 7
      AND
         as_agg_2baaa92f_q3_t97.sold_d_customer_gmt_offse_c11 = -5.00
      AND
         as_agg_2baaa92f_q3_t97.i_category_c9 = 'Electronics'
      AND
         as_agg_2baaa92f_q3_t97.sold_calendar_year_week_c10 = 1999
   ) AS t_107
   WHERE
      true
   GROUP BY
      1,
      3
) AS t_123
ORDER BY
   2 DESC
LIMIT 100

-- Q42
--
-- DDL (covered by Q98 agg)
CREATE TABLE `benchmark-251817.aggregates.as_agg_6bed8fce_q98`
(
  key_c1 STRING,
  key_c2 INT64,
  key_c3 STRING,
  key_c4 NUMERIC,
  key_c5 INT64,
  key_c6 NUMERIC,
  key_c7 STRING,
  i_category_c8 STRING,
  product_dimension_c9 STRING,
  sold_time_dimension_c10 DATE,
  d_product_class_name_c11 STRING,
  d_product_current_price_c12 NUMERIC,
  m_ss_ext_sales_price_sum_c13 NUMERIC,
  m_ss_ext_sales_price_sum_c14 NUMERIC,
  m_ss_ext_sales_price_sum_c15 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=57bb46d7-dfce-4c1b-8fb7-75c85636be5d */
   item_t182.i_class AS key_c1,
   date_dim_t183.d_date_sk AS key_c2,
   item_t182.i_category AS key_c3,
   item_t182.i_current_price AS key_c4,
   item_t182.i_item_sk AS key_c5,
   item_t182.i_current_price AS key_c6,
   item_t182.i_class AS key_c7,
   item_t182.i_category AS i_category_c8,
   item_t182.i_item_desc AS product_dimension_c9,
   date_dim_t183.d_date AS sold_time_dimension_c10,
   item_t182.i_class AS d_product_class_name_c11,
   item_t182.i_current_price AS d_product_current_price_c12,
   SAFE_CAST(SUM(store_sales_t181.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c13,
   SAFE_CAST(MIN(store_sales_t181.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c14,
   SAFE_CAST(MAX(store_sales_t181.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c15
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t181
JOIN
   `benchmark-251817`.TPCDS_10TB.item AS item_t182
ON
   store_sales_t181.ss_item_sk = item_t182.i_item_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t183
ON
   store_sales_t181.ss_sold_date_sk = date_dim_t183.d_date_sk
WHERE
   true
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
   11,
   12
-- AtScale Generated User Query
SELECT
/* queryId=c451302d-4059-45b0-9b61-b6dfbe8bce26 */
   t_90.sold_calendar_year_gbakc3 AS sold_calendar_year_week,
   t_90.i_category_gbakc4 AS i_category,
   t_90.sum_m_ss_ext_sales_gbakc5 AS sum_m_ss_ext_sales_price_sum_ok
FROM
(
   SELECT
      t_88.d_year_c87 AS sold_calendar_year_gbakc3,
      as_agg_6bed8fce_q9_t79.i_category_c8 AS i_category_gbakc4,
      SUM(as_agg_6bed8fce_q9_t79.m_ss_ext_sales_price_sum_c13) AS sum_m_ss_ext_sales_gbakc5,
      t_88.d_year_c87 AS sold_calendar_year_gbakc1,
      as_agg_6bed8fce_q9_t79.key_c3 AS i_category_gbakc2
   FROM
      `benchmark-251817`.aggregates.as_agg_6bed8fce_q98 AS as_agg_6bed8fce_q9_t79
   JOIN
   (
      SELECT
         item_t80.i_item_sk AS i_item_sk_c81,
         item_t80.i_manager_id AS i_manager_id_c82
      FROM
         `benchmark-251817`.TPCDS_10TB.item AS item_t80
      WHERE
         item_t80.i_manager_id = 1
      GROUP BY
         1,
         2
   ) AS t_83
   ON
      as_agg_6bed8fce_q9_t79.key_c5 = t_83.i_item_sk_c81
   JOIN
   (
      SELECT
         date_dim_t84.d_date_sk AS d_date_sk_c86,
         date_dim_t84.d_moy AS d_moy_c85,
         date_dim_t84.d_year AS d_year_c87
      FROM
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t84
      WHERE
         date_dim_t84.d_year = 1998
      AND
         date_dim_t84.d_moy = 12
      GROUP BY
         1,
         2,
         3
   ) AS t_88
   ON
      as_agg_6bed8fce_q9_t79.key_c2 = t_88.d_date_sk_c86
   WHERE
      true
   GROUP BY
      1,
      2,
      4,
      5
) AS t_90
ORDER BY
   3 DESC

-- Q48
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_601d0cb4_q48`
(
  key_c1 STRING,
  key_c2 STRING,
  key_c3 STRING,
  key_c4 INT64,
  key_c5 STRING,
  key_c6 STRING,
  key_c7 STRING,
  key_c8 STRING,
  key_c9 STRING,
  key_c10 STRING,
  sold_calendar_year_week_c11 INT64,
  sold_d_customer_country_c12 STRING,
  sold_d_customer_state_c13 STRING,
  d_cd_education_status_c14 STRING,
  d_cd_marital_status_c15 STRING,
  d_net_profit_tier_c16 STRING,
  d_sales_price_tier_c17 STRING,
  m_ss_quantity_sum_c18 INT64,
  m_ss_quantity_sum_c19 INT64,
  m_ss_quantity_sum_c20 INT64
);
-- AtScale Agg Creation Query
SELECT
/* queryId=cc75289b-6556-46e5-afa0-f2b91fd63a13 */
   CASE WHEN store_sales_t241.SS_NET_PROFIT > 25000 THEN 'More than 25000'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 3000 AND 25000 THEN '3000-25000'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 2000 AND 3000 THEN '2000-3000'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 300 AND 2000 THEN '300-2000'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 250 AND 300 THEN '250-300'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 200 AND 250 THEN '200-250'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 150 AND 200 THEN '150-200'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 100 AND 150 THEN '100-150'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 50 AND 100 THEN ' 50-100'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 0 AND 50 THEN '  0- 50'
ELSE ' 50 or Less' END AS key_c1,
   CASE WHEN store_sales_t241.SS_SALES_PRICE > 200 THEN '200 and More'
WHEN store_sales_t241.SS_SALES_PRICE BETWEEN 150 AND 200 THEN '150-200'
WHEN store_sales_t241.SS_SALES_PRICE BETWEEN 100 AND 150 THEN '100-150'
WHEN store_sales_t241.SS_SALES_PRICE BETWEEN 50 AND 100 THEN ' 50-100'
ELSE ' 50 and Less' END AS key_c2,
   customer_demograph_t244.cd_marital_status AS key_c3,
   date_dim_t246.d_year AS key_c4,
   customer_demograph_t244.cd_education_status AS key_c5,
   customer_demograph_t244.cd_marital_status AS key_c6,
   customer_address_t245.ca_country AS key_c7,
   customer_address_t245.ca_state AS key_c8,
   customer_demograph_t244.cd_education_status AS key_c9,
   customer_address_t245.ca_country AS key_c10,
   date_dim_t246.d_year AS sold_calendar_year_week_c11,
   customer_address_t245.ca_country AS sold_d_customer_country_c12,
   customer_address_t245.ca_state AS sold_d_customer_state_c13,
   customer_demograph_t244.cd_education_status AS d_cd_education_status_c14,
   customer_demograph_t244.cd_marital_status AS d_cd_marital_status_c15,
   CASE WHEN store_sales_t241.SS_NET_PROFIT > 25000 THEN 'More than 25000'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 3000 AND 25000 THEN '3000-25000'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 2000 AND 3000 THEN '2000-3000'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 300 AND 2000 THEN '300-2000'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 250 AND 300 THEN '250-300'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 200 AND 250 THEN '200-250'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 150 AND 200 THEN '150-200'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 100 AND 150 THEN '100-150'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 50 AND 100 THEN ' 50-100'
WHEN store_sales_t241.SS_NET_PROFIT BETWEEN 0 AND 50 THEN '  0- 50'
ELSE ' 50 or Less' END AS d_net_profit_tier_c16,
   CASE WHEN store_sales_t241.SS_SALES_PRICE > 200 THEN '200 and More'
WHEN store_sales_t241.SS_SALES_PRICE BETWEEN 150 AND 200 THEN '150-200'
WHEN store_sales_t241.SS_SALES_PRICE BETWEEN 100 AND 150 THEN '100-150'
WHEN store_sales_t241.SS_SALES_PRICE BETWEEN 50 AND 100 THEN ' 50-100'
ELSE ' 50 and Less' END AS d_sales_price_tier_c17,
   SAFE_CAST(SUM(store_sales_t241.ss_quantity) AS INT64) AS m_ss_quantity_sum_c18,
   SAFE_CAST(MIN(store_sales_t241.ss_quantity) AS INT64) AS m_ss_quantity_sum_c19,
   SAFE_CAST(MAX(store_sales_t241.ss_quantity) AS INT64) AS m_ss_quantity_sum_c20
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t241
JOIN
   `benchmark-251817`.TPCDS_10TB.customer_demographics AS customer_demograph_t244
ON
   store_sales_t241.ss_cdemo_sk = customer_demograph_t244.cd_demo_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t245
ON
   store_sales_t241.ss_addr_sk = customer_address_t245.ca_address_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t246
ON
   store_sales_t241.ss_sold_date_sk = date_dim_t246.d_date_sk
WHERE
   true
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
   11,
   12,
   13,
   14,
   15,
   16,
   17
-- AtScale Generated User Query
SELECT
/* queryId=9b01e90b-b5b4-48b6-96ea-a1741b25f415 */
   SUM(t_112.m_ss_quantity_sum__c108) AS sum_m_ss_quantity_sum_ok
FROM
(
   SELECT
      as_agg_601d0cb4_q4_t103.d_cd_education_status_c14 AS d_cd_education_sta_c105,
      as_agg_601d0cb4_q4_t103.d_cd_marital_status_c15 AS d_cd_marital_statu_c107,
      as_agg_601d0cb4_q4_t103.d_net_profit_tier_c16 AS d_net_profit_tier__c110,
      as_agg_601d0cb4_q4_t103.d_sales_price_tier_c17 AS d_sales_price_tier_c111,
      as_agg_601d0cb4_q4_t103.m_ss_quantity_sum_c18 AS m_ss_quantity_sum__c108,
      as_agg_601d0cb4_q4_t103.sold_calendar_year_week_c11 AS sold_calendar_year_c106,
      as_agg_601d0cb4_q4_t103.sold_d_customer_country_c12 AS sold_d_customer_co_c104,
      as_agg_601d0cb4_q4_t103.sold_d_customer_state_c13 AS sold_d_customer_st_c109
   FROM
      `benchmark-251817`.aggregates.as_agg_601d0cb4_q48 AS as_agg_601d0cb4_q4_t103
   WHERE
   (
            as_agg_601d0cb4_q4_t103.d_net_profit_tier_c16 IN ('  0- 50', ' 50-100', '100-150', '150-200', '200-250', '250-300', '300-2000')
         AND
            as_agg_601d0cb4_q4_t103.sold_d_customer_country_c12 = 'United States'
         AND
            as_agg_601d0cb4_q4_t103.sold_d_customer_state_c13 IN ('IL', 'AR', 'UT')
      OR
            as_agg_601d0cb4_q4_t103.d_net_profit_tier_c16 IN ('150-200', '200-250', '250-300', '300-2000', '2000-3000')
         AND
            as_agg_601d0cb4_q4_t103.sold_d_customer_country_c12 = 'United States'
         AND
            as_agg_601d0cb4_q4_t103.sold_d_customer_state_c13 IN ('WV', 'GA', 'NC')
      OR
            as_agg_601d0cb4_q4_t103.d_net_profit_tier_c16 IN (' 50-100', '100-150', '150-200', '200-250', '250-300', '300-2000', '2000-3000', '3000-25000')
         AND
            as_agg_601d0cb4_q4_t103.sold_d_customer_country_c12 = 'United States'
         AND
            as_agg_601d0cb4_q4_t103.sold_d_customer_state_c13 IN ('PA', 'LA', 'MO') )
   AND
      as_agg_601d0cb4_q4_t103.sold_calendar_year_week_c11 = 1999
   AND
   (
            as_agg_601d0cb4_q4_t103.d_sales_price_tier_c17 = '100-150'
         AND
            as_agg_601d0cb4_q4_t103.d_cd_marital_status_c15 = 'S'
         AND
            as_agg_601d0cb4_q4_t103.d_cd_education_status_c14 = 'Primary'
      OR
            as_agg_601d0cb4_q4_t103.d_sales_price_tier_c17 = ' 50-100'
         AND
            as_agg_601d0cb4_q4_t103.d_cd_marital_status_c15 = 'U'
         AND
            as_agg_601d0cb4_q4_t103.d_cd_education_status_c14 = 'Advanced Degree'
      OR
            as_agg_601d0cb4_q4_t103.d_sales_price_tier_c17 = '150-200'
         AND
            as_agg_601d0cb4_q4_t103.d_cd_marital_status_c15 = 'W'
         AND
            as_agg_601d0cb4_q4_t103.d_cd_education_status_c14 = '4 yr Degree' )
) AS t_112
WHERE
   true

-- Q50
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_0071c792_q50`
(
  key_c1 STRING,
  key_c2 STRING,
  key_c3 STRING,
  key_c4 STRING,
  key_c5 STRING,
  key_c6 INT64,
  key_c7 INT64,
  key_c8 STRING,
  key_c9 STRING,
  key_c10 STRING,
  key_c11 STRING,
  key_c12 INT64,
  key_c13 STRING,
  key_c14 STRING,
  key_c15 INT64,
  key_c16 STRING,
  key_c17 STRING,
  key_c18 STRING,
  key_c19 STRING,
  key_c20 INT64,
  key_c21 STRING,
  key_c22 STRING,
  key_c23 STRING,
  key_c24 STRING,
  key_c25 STRING,
  key_c26 STRING,
  return_calendar_year_week_c27 INT64,
  return_d_month_of_year_c28 INT64,
  d_returns_time_tier_c29 STRING,
  d_store_city_c30 STRING,
  d_store_company_id_c31 INT64,
  d_store_country_c32 STRING,
  d_store_county_c33 STRING,
  d_store_name_c34 STRING,
  d_store_state_c35 STRING,
  d_store_street_name_c36 STRING,
  d_store_street_number_c37 STRING,
  d_store_street_type_c38 STRING,
  d_store_suite_number_c39 STRING,
  d_store_zip_code_c40 STRING,
  m_returns_count_sum_c41 INT64,
  m_returns_count_sum_c42 INT64,
  m_returns_count_sum_c43 INT64
);
-- AtScale Agg Creation Query
SELECT
/* queryId=941a1a80-fd6d-400d-ad89-9af169ae7532 */
   store_t518.s_country AS key_c1,
   store_t518.s_state AS key_c2,
   store_t518.s_country AS key_c3,
   store_t518.s_state AS key_c4,
   store_t518.s_city AS key_c5,
   date_dim_t519.d_moy AS key_c6,
   store_t518.s_company_id AS key_c7,
   store_t518.s_store_name AS key_c8,
   store_t518.s_street_name AS key_c9,
   store_t518.s_zip AS key_c10,
   store_t518.s_store_name AS key_c11,
   date_dim_t519.d_year AS key_c12,
   store_t518.s_street_type AS key_c13,
   store_t518.s_zip AS key_c14,
   date_dim_t519.d_moy AS key_c15,
   store_t518.s_street_type AS key_c16,
   store_t518.s_street_name AS key_c17,
   store_t518.s_street_number AS key_c18,
   store_t518.s_suite_number AS key_c19,
   store_t518.s_company_id AS key_c20,
   store_t518.s_state AS key_c21,
   store_t518.s_county AS key_c22,
   store_t518.s_country AS key_c23,
   t_517.returns_time_tier AS key_c24,
   store_t518.s_street_number AS key_c25,
   store_t518.s_suite_number AS key_c26,
   date_dim_t519.d_year AS return_calendar_year_week_c27,
   date_dim_t519.d_moy AS return_d_month_of_year_c28,
   t_517.returns_time_tier AS d_returns_time_tier_c29,
   store_t518.s_city AS d_store_city_c30,
   store_t518.s_company_id AS d_store_company_id_c31,
   store_t518.s_country AS d_store_country_c32,
   store_t518.s_county AS d_store_county_c33,
   store_t518.s_store_name AS d_store_name_c34,
   store_t518.s_state AS d_store_state_c35,
   store_t518.s_street_name AS d_store_street_name_c36,
   store_t518.s_street_number AS d_store_street_number_c37,
   store_t518.s_street_type AS d_store_street_type_c38,
   store_t518.s_suite_number AS d_store_suite_number_c39,
   store_t518.s_zip AS d_store_zip_code_c40,
   SAFE_CAST(SUM(t_517.returns_count) AS INT64) AS m_returns_count_sum_c41,
   SAFE_CAST(MIN(t_517.returns_count) AS INT64) AS m_returns_count_sum_c42,
   SAFE_CAST(MAX(t_517.returns_count) AS INT64) AS m_returns_count_sum_c43
FROM
(
SELECT ss.*, sr.*,
  case when (sr_returned_date_sk - ss_sold_date_sk <= 30) then '<= 30 days'
  when (sr_returned_date_sk - ss_sold_date_sk > 30) and
                 (sr_returned_date_sk - ss_sold_date_sk <= 60) then '31-60 days'
  when (sr_returned_date_sk - ss_sold_date_sk > 60) and
                 (sr_returned_date_sk - ss_sold_date_sk <= 90) then '61-90 days'
  when (sr_returned_date_sk - ss_sold_date_sk > 90) and
                 (sr_returned_date_sk - ss_sold_date_sk <= 120) then '91-120 days'
  else '> 120 days' end as returns_time_tier,
  1 as returns_count
	FROM `benchmark-251817`.TPCDS_10TB.store_returns sr
	INNER JOIN `benchmark-251817`.TPCDS_10TB.store_sales ss
		ON	ss.ss_ticket_number = sr.sr_ticket_number
		AND ss.ss_item_sk = sr.sr_item_sk
		AND ss.ss_customer_sk = sr.sr_customer_sk
) AS t_517
JOIN
   `benchmark-251817`.TPCDS_10TB.store AS store_t518
ON
   t_517.sr_store_sk = store_t518.s_store_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t519
ON
   t_517.sr_returned_date_sk = date_dim_t519.d_date_sk
WHERE
   true
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
   11,
   12,
   13,
   14,
   15,
   16,
   17,
   18,
   19,
   20,
   21,
   22,
   23,
   24,
   25,
   26,
   27,
   28,
   29,
   30,
   31,
   32,
   33,
   34,
   35,
   36,
   37,
   38,
   39,
   40
-- AtScale Generated User Query
SELECT
/* queryId=784037fa-8b8e-435d-b1cf-cc44cd34c7e7 */
   t_369.d_store_name_gbakc16 AS d_store_name,
   t_369.d_store_company_id_gbakc17 AS d_store_company_id,
   t_369.d_store_street_num_gbakc18 AS d_store_street_number,
   t_369.d_store_street_nam_gbakc19 AS d_store_street_name,
   t_369.d_store_street_typ_gbakc20 AS d_store_street_type,
   t_369.d_store_suite_numb_gbakc21 AS d_store_suite_number,
   t_369.d_store_city_gbakc22 AS d_store_city,
   t_369.d_store_county_gbakc23 AS d_store_county,
   t_369.d_store_state_gbakc24 AS d_store_state,
   t_369.d_store_zip_code_gbakc25 AS d_store_zip_code,
   t_369.d_returns_time_tie_gbakc26 AS d_returns_time_tier,
   t_369.sum_m_returns_coun_gbakc27 AS sum_m_returns_count_sum_ok
FROM
(
   SELECT
      t_367.d_store_name_c34_c338 AS d_store_name_gbakc16,
      t_367.d_store_company_id_c339 AS d_store_company_id_gbakc17,
      t_367.d_store_street_num_c356 AS d_store_street_num_gbakc18,
      t_367.d_store_street_nam_c346 AS d_store_street_nam_gbakc19,
      t_367.d_store_street_typ_c347 AS d_store_street_typ_gbakc20,
      t_367.d_store_suite_numb_c366 AS d_store_suite_numb_gbakc21,
      t_367.d_store_city_c30_c363 AS d_store_city_gbakc22,
      t_367.d_store_county_c33_c355 AS d_store_county_gbakc23,
      t_367.d_store_state_c35_c340 AS d_store_state_gbakc24,
      t_367.d_store_zip_code_c_c357 AS d_store_zip_code_gbakc25,
      t_367.d_returns_time_tie_c358 AS d_returns_time_tie_gbakc26,
      SUM(t_367.m_returns_count_su_c341) AS sum_m_returns_coun_gbakc27,
      t_367.key_c11_c364 AS d_store_name_gbakc1,
      t_367.key_c7_c353 AS d_store_company_id_gbakc2,
      t_367.key_c25_c348 AS d_store_street_num_gbakc3,
      t_367.key_c9_c345 AS d_store_street_nam_gbakc4,
      t_367.key_c13_c344 AS d_store_street_typ_gbakc5,
      t_367.key_c19_c365 AS d_store_suite_numb_gbakc6,
      t_367.key_c3_c359 AS d_store_city_gbakc7,
      t_367.key_c4_c360 AS d_store_city_gbakc8,
      t_367.key_c5_c361 AS d_store_city_gbakc9,
      t_367.key_c21_c351 AS d_store_county_gbakc10,
      t_367.key_c22_c352 AS d_store_county_gbakc11,
      t_367.key_c1_c342 AS d_store_state_gbakc12,
      t_367.key_c2_c343 AS d_store_state_gbakc13,
      t_367.key_c14_c349 AS d_store_zip_code_gbakc14,
      t_367.key_c24_c362 AS d_returns_time_tie_gbakc15
   FROM
   (
      SELECT
         as_agg_0071c792_q5_t337.d_returns_time_tier_c29 AS d_returns_time_tie_c358,
         as_agg_0071c792_q5_t337.d_store_city_c30 AS d_store_city_c30_c363,
         as_agg_0071c792_q5_t337.d_store_company_id_c31 AS d_store_company_id_c339,
         as_agg_0071c792_q5_t337.d_store_county_c33 AS d_store_county_c33_c355,
         as_agg_0071c792_q5_t337.d_store_name_c34 AS d_store_name_c34_c338,
         as_agg_0071c792_q5_t337.d_store_state_c35 AS d_store_state_c35_c340,
         as_agg_0071c792_q5_t337.d_store_street_name_c36 AS d_store_street_nam_c346,
         as_agg_0071c792_q5_t337.d_store_street_number_c37 AS d_store_street_num_c356,
         as_agg_0071c792_q5_t337.d_store_street_type_c38 AS d_store_street_typ_c347,
         as_agg_0071c792_q5_t337.d_store_suite_number_c39 AS d_store_suite_numb_c366,
         as_agg_0071c792_q5_t337.d_store_zip_code_c40 AS d_store_zip_code_c_c357,
         as_agg_0071c792_q5_t337.key_c11 AS key_c11_c364,
         as_agg_0071c792_q5_t337.key_c13 AS key_c13_c344,
         as_agg_0071c792_q5_t337.key_c14 AS key_c14_c349,
         as_agg_0071c792_q5_t337.key_c19 AS key_c19_c365,
         as_agg_0071c792_q5_t337.key_c1 AS key_c1_c342,
         as_agg_0071c792_q5_t337.key_c21 AS key_c21_c351,
         as_agg_0071c792_q5_t337.key_c22 AS key_c22_c352,
         as_agg_0071c792_q5_t337.key_c24 AS key_c24_c362,
         as_agg_0071c792_q5_t337.key_c25 AS key_c25_c348,
         as_agg_0071c792_q5_t337.key_c2 AS key_c2_c343,
         as_agg_0071c792_q5_t337.key_c3 AS key_c3_c359,
         as_agg_0071c792_q5_t337.key_c4 AS key_c4_c360,
         as_agg_0071c792_q5_t337.key_c5 AS key_c5_c361,
         as_agg_0071c792_q5_t337.key_c7 AS key_c7_c353,
         as_agg_0071c792_q5_t337.key_c9 AS key_c9_c345,
         as_agg_0071c792_q5_t337.m_returns_count_sum_c41 AS m_returns_count_su_c341,
         as_agg_0071c792_q5_t337.return_calendar_year_week_c27 AS return_calendar_ye_c350,
         as_agg_0071c792_q5_t337.return_d_month_of_year_c28 AS return_d_month_of__c354
      FROM
         `benchmark-251817`.aggregates.as_agg_0071c792_q50 AS as_agg_0071c792_q5_t337
      WHERE
         as_agg_0071c792_q5_t337.return_calendar_year_week_c27 = 1998
      AND
         as_agg_0071c792_q5_t337.return_d_month_of_year_c28 = 9
   ) AS t_367
   WHERE
      true
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
      11,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27
) AS t_369
ORDER BY
   1 ASC,
   2 ASC,
   3 ASC,
   4 ASC,
   5 ASC,
   6 ASC,
   7 ASC,
   8 ASC,
   9 ASC,
   10 ASC,
   11 ASC
LIMIT 100

-- Q52
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_abc22c40_q52`
(
  key_c1 STRING,
  key_c2 INT64,
  key_c3 INT64,
  key_c4 INT64,
  key_c5 INT64,
  key_c6 INT64,
  key_c7 INT64,
  key_c8 INT64,
  key_c9 INT64,
  sold_calendar_year_week_c10 INT64,
  sold_d_month_of_year_c11 INT64,
  d_product_brand_id_c12 INT64,
  d_product_brand_name_c13 STRING,
  d_product_manager_id_c14 INT64,
  m_ss_ext_sales_price_sum_c15 NUMERIC,
  m_ss_ext_sales_price_sum_c16 NUMERIC,
  m_ss_ext_sales_price_sum_c17 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=be4d61ee-b831-42c7-8616-44c0d552675d */
   item_t206.i_brand AS key_c1,
   item_t206.i_manager_id AS key_c2,
   date_dim_t207.d_moy AS key_c3,
   item_t206.i_brand_id AS key_c4,
   date_dim_t207.d_year AS key_c5,
   date_dim_t207.d_moy AS key_c6,
   item_t206.i_brand_id AS key_c7,
   item_t206.i_manager_id AS key_c8,
   item_t206.i_brand_id AS key_c9,
   date_dim_t207.d_year AS sold_calendar_year_week_c10,
   date_dim_t207.d_moy AS sold_d_month_of_year_c11,
   item_t206.i_brand_id AS d_product_brand_id_c12,
   item_t206.i_brand AS d_product_brand_name_c13,
   item_t206.i_manager_id AS d_product_manager_id_c14,
   SAFE_CAST(SUM(store_sales_t205.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c15,
   SAFE_CAST(MIN(store_sales_t205.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c16,
   SAFE_CAST(MAX(store_sales_t205.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c17
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t205
JOIN
   `benchmark-251817`.TPCDS_10TB.item AS item_t206
ON
   store_sales_t205.ss_item_sk = item_t206.i_item_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t207
ON
   store_sales_t205.ss_sold_date_sk = date_dim_t207.d_date_sk
WHERE
   true
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
   11,
   12,
   13,
   14
-- AtScale Generated User Query
SELECT
/* queryId=dc480cc1-41b3-4d61-b411-d113e40ca01c */
   t_115.sold_calendar_year_gbakc4 AS sold_calendar_year_week,
   t_115.d_product_brand_id_gbakc5 AS d_product_brand_id,
   t_115.d_product_brand_na_gbakc6 AS d_product_brand_name,
   t_115.sum_m_ss_ext_sales_gbakc7 AS sum_m_ss_ext_sales_price_sum_ok
FROM
(
   SELECT
      t_113.sold_calendar_year_c108 AS sold_calendar_year_gbakc4,
      t_113.d_product_brand_id_c110 AS d_product_brand_id_gbakc5,
      t_113.d_product_brand_na_c112 AS d_product_brand_na_gbakc6,
      SUM(t_113.m_ss_ext_sales_pri_c111) AS sum_m_ss_ext_sales_gbakc7,
      t_113.key_c5_c106 AS sold_calendar_year_gbakc1,
      t_113.key_c9_c107 AS d_product_brand_id_gbakc2,
      t_113.key_c4_c104 AS d_product_brand_na_gbakc3
   FROM
   (
      SELECT
         as_agg_ee954ca6_q5_t103.d_product_brand_id_c12 AS d_product_brand_id_c110,
         as_agg_ee954ca6_q5_t103.d_product_brand_name_c13 AS d_product_brand_na_c112,
         as_agg_ee954ca6_q5_t103.d_product_manager_id_c14 AS d_product_manager__c105,
         as_agg_ee954ca6_q5_t103.key_c4 AS key_c4_c104,
         as_agg_ee954ca6_q5_t103.key_c5 AS key_c5_c106,
         as_agg_ee954ca6_q5_t103.key_c9 AS key_c9_c107,
         as_agg_ee954ca6_q5_t103.m_ss_ext_sales_price_sum_c15 AS m_ss_ext_sales_pri_c111,
         as_agg_ee954ca6_q5_t103.sold_calendar_year_week_c10 AS sold_calendar_year_c108,
         as_agg_ee954ca6_q5_t103.sold_d_month_of_year_c11 AS sold_d_month_of_ye_c109
      FROM
         `benchmark-251817`.aggregates.as_agg_ee954ca6_q52 AS as_agg_ee954ca6_q5_t103
      WHERE
         as_agg_ee954ca6_q5_t103.d_product_manager_id_c14 = 1
      AND
         as_agg_ee954ca6_q5_t103.sold_calendar_year_week_c10 = 2002
      AND
         as_agg_ee954ca6_q5_t103.sold_d_month_of_year_c11 = 12
   ) AS t_113
   WHERE
      true
   GROUP BY
      1,
      2,
      3,
      5,
      6,
      7
) AS t_115
ORDER BY
   1 ASC,
   4 DESC,
   2 ASC
LIMIT 100

-- Q53
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_d4486ccf_q53`
(
  key_c1 STRING,
  key_c2 STRING,
  key_c3 INT64,
  key_c4 INT64,
  key_c5 STRING,
  key_c6 INT64,
  key_c7 STRING,
  key_c8 STRING,
  key_c9 STRING,
  i_category_c10 STRING,
  sold_calendar_quarter_c11 STRING,
  d_product_brand_name_c12 STRING,
  d_product_class_name_c13 STRING,
  d_product_manufacturer_id_c14 INT64,
  m_store_sales_price_c15 NUMERIC,
  m_store_sales_price_c16 NUMERIC,
  m_store_sales_price_c17 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=9118c35c-a587-4f85-9b7a-e075597fcf75 */
   item_t206.i_brand AS key_c1,
   item_t206.i_class AS key_c2,
   item_t206.i_manufact_id AS key_c3,
   item_t206.i_brand_id AS key_c4,
   item_t206.i_category AS key_c5,
   item_t206.i_manufact_id AS key_c6,
   CONCAT(SUBSTR(CAST(date_dim_t207.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t207.D_QOY AS STRING), 2, '0'),'-01') AS key_c7,
   CONCAT(SUBSTR(CAST(date_dim_t207.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t207.D_QOY AS STRING), 2, '0'),'-01') AS key_c8,
   item_t206.i_class AS key_c9,
   item_t206.i_category AS i_category_c10,
   date_dim_t207.d_quarter_name AS sold_calendar_quarter_c11,
   item_t206.i_brand AS d_product_brand_name_c12,
   item_t206.i_class AS d_product_class_name_c13,
   item_t206.i_manufact_id AS d_product_manufacturer_id_c14,
   SAFE_CAST(SUM(store_sales_t205.ss_sales_price) AS NUMERIC) AS m_store_sales_price_c15,
   SAFE_CAST(MIN(store_sales_t205.ss_sales_price) AS NUMERIC) AS m_store_sales_price_c16,
   SAFE_CAST(MAX(store_sales_t205.ss_sales_price) AS NUMERIC) AS m_store_sales_price_c17
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t205
JOIN
   `benchmark-251817`.TPCDS_10TB.item AS item_t206
ON
   store_sales_t205.ss_item_sk = item_t206.i_item_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t207
ON
   store_sales_t205.ss_sold_date_sk = date_dim_t207.d_date_sk
WHERE
   true
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
   11,
   12,
   13,
   14
-- AtScale Generated User Query
SELECT
/* queryId=e2a17f1b-3734-4f64-80ed-905b4fc5bdaa */
   t_755.d_product_manufact_gbakc3 AS d_product_manufacturer_id,
   t_755.sold_calendar_quar_gbakc4 AS sold_calendar_quarter,
   t_755.sum_m_store_sales__gbakc5 AS sum_m_store_sales_price_ok,
   t_755.sum_avg_quarterly__gbakc6 AS sum_avg_quarterly_store_sales_for_1998_1999_ok,
   t_755.sum_avg_quarter_sa_gbakc7 AS sum_avg_quarter_sales_ratio_ok
FROM
(
   SELECT
      t_573.d_product_manufact_gbakc3 AS d_product_manufact_gbakc3,
      t_573.sold_calendar_quar_gbakc4 AS sold_calendar_quar_gbakc4,
      MIN(t_573.sum_m_store_sales__gbakc5) AS sum_m_store_sales__gbakc5,
      MIN(t_573.c_229) AS sum_avg_quarterly__gbakc6,
      CASE WHEN COALESCE(MIN(t_573.c_229), 0) = 0 THEN (SAFE_CAST('Infinity' AS FLOAT64) * SAFE_CAST(SIGN(CASE WHEN CASE WHEN MIN(t_573.c_232) IS NULL THEN (-1 * MIN(t_573.c_229)) WHEN MIN(t_573.c_229) IS NULL THEN MIN(t_573.c_232) ELSE (MIN(t_573.c_232) - MIN(t_573.c_229)) END < 0 THEN (-1 * CASE WHEN MIN(t_573.c_232) IS NULL THEN (-1 * MIN(t_573.c_229)) WHEN MIN(t_573.c_229) IS NULL THEN MIN(t_573.c_232) ELSE (MIN(t_573.c_232) - MIN(t_573.c_229)) END) ELSE CASE WHEN MIN(t_573.c_232) IS NULL THEN (-1 * MIN(t_573.c_229)) WHEN MIN(t_573.c_229) IS NULL THEN MIN(t_573.c_232) ELSE (MIN(t_573.c_232) - MIN(t_573.c_229)) END END) AS FLOAT64)) ELSE CASE WHEN MIN(t_573.c_229) = 0 THEN NULL ELSE (CASE WHEN CASE WHEN MIN(t_573.c_232) IS NULL THEN (-1 * MIN(t_573.c_229)) WHEN MIN(t_573.c_229) IS NULL THEN MIN(t_573.c_232) ELSE (MIN(t_573.c_232) - MIN(t_573.c_229)) END < 0 THEN (-1 * CASE WHEN MIN(t_573.c_232) IS NULL THEN (-1 * MIN(t_573.c_229)) WHEN MIN(t_573.c_229) IS NULL THEN MIN(t_573.c_232) ELSE (MIN(t_573.c_232) - MIN(t_573.c_229)) END) ELSE CASE WHEN MIN(t_573.c_232) IS NULL THEN (-1 * MIN(t_573.c_229)) WHEN MIN(t_573.c_229) IS NULL THEN MIN(t_573.c_232) ELSE (MIN(t_573.c_232) - MIN(t_573.c_229)) END END / MIN(t_573.c_229)) END END AS sum_avg_quarter_sa_gbakc7,
      t_573.d_product_manufact_gbakc1 AS d_product_manufact_gbakc1,
      t_573.sold_calendar_quar_gbakc2 AS sold_calendar_quar_gbakc2
   FROM
   (
      SELECT
         t_572.d_product_manufact_gbakc3 AS d_product_manufact_gbakc3,
         t_572.sold_calendar_quar_gbakc4 AS sold_calendar_quar_gbakc4,
         MIN(t_572.sum_m_store_sales__gbakc5) AS sum_m_store_sales__gbakc5,
         MIN(t_572.c_229) AS c_229,
         MIN(t_572.c_232) AS c_232,
         t_572.d_product_manufact_gbakc1 AS d_product_manufact_gbakc1,
         t_572.sold_calendar_quar_gbakc2 AS sold_calendar_quar_gbakc2
      FROM
      (
            SELECT
               t_509.d_product_manufact_c507 AS d_product_manufact_gbakc3,
               t_509.sold_calendar_quar_c503 AS sold_calendar_quar_gbakc4,
               SUM(t_509.m_store_sales_pric_c504) AS sum_m_store_sales__gbakc5,
               SAFE_CAST(NULL AS NUMERIC) AS c_229,
               SUM(t_509.m_store_sales_pric_c504) AS c_232,
               t_509.key_c3_c505 AS d_product_manufact_gbakc1,
               t_509.key_c8_c506 AS sold_calendar_quar_gbakc2
            FROM
            (
               SELECT
                  as_agg_d4486ccf_q5_t500.d_product_brand_name_c12 AS d_product_brand_na_c501,
                  as_agg_d4486ccf_q5_t500.d_product_class_name_c13 AS d_product_class_na_c508,
                  as_agg_d4486ccf_q5_t500.d_product_manufacturer_id_c14 AS d_product_manufact_c507,
                  as_agg_d4486ccf_q5_t500.i_category_c10 AS i_category_c10_c502,
                  as_agg_d4486ccf_q5_t500.key_c3 AS key_c3_c505,
                  as_agg_d4486ccf_q5_t500.key_c8 AS key_c8_c506,
                  as_agg_d4486ccf_q5_t500.m_store_sales_price_c15 AS m_store_sales_pric_c504,
                  as_agg_d4486ccf_q5_t500.sold_calendar_quarter_c11 AS sold_calendar_quar_c503
               FROM
                  `benchmark-251817`.aggregates.as_agg_d4486ccf_q53 AS as_agg_d4486ccf_q5_t500
               WHERE
                  as_agg_d4486ccf_q5_t500.sold_calendar_quarter_c11 IN ('1998Q2', '1998Q3', '1998Q4', '1999Q1', '1999Q2')
               AND
               (
                        as_agg_d4486ccf_q5_t500.d_product_class_name_c13 IN ('personal', 'portable', 'reference', 'self-help')
                     AND
                        as_agg_d4486ccf_q5_t500.i_category_c10 IN ('Books', 'Children', 'Electronics')
                     AND
                        as_agg_d4486ccf_q5_t500.d_product_brand_name_c12 IN ('exportiunivamalg #9', 'scholaramalgamalg #14', 'scholaramalgamalg #7', 'scholaramalgamalg #9')
                  OR
                        as_agg_d4486ccf_q5_t500.d_product_class_name_c13 IN ('accessories', 'classical', 'fragrances', 'pants')
                     AND
                        as_agg_d4486ccf_q5_t500.i_category_c10 IN ('Women', 'Music', 'Men')
                     AND
                        as_agg_d4486ccf_q5_t500.d_product_brand_name_c12 IN ('amalgimporto #1', 'edu packscholar #1', 'exportiimporto #1', 'importoamalg #1') )
            ) AS t_509
            WHERE
               true
            GROUP BY
               1,
               2,
               6,
               7
         UNION ALL
            SELECT
               t_561.d_product_manufact_gbakc3 AS d_product_manufact_gbakc3,
               t_561.sold_calendar_quar_gbakc4 AS sold_calendar_quar_gbakc4,
               SAFE_CAST(NULL AS NUMERIC) AS sum_m_store_sales__gbakc5,
               AVG(t_570.c_229) AS c_229,
               SAFE_CAST(NULL AS NUMERIC) AS c_232,
               t_561.d_product_manufact_gbakc1 AS d_product_manufact_gbakc1,
               t_561.sold_calendar_quar_gbakc2 AS sold_calendar_quar_gbakc2
            FROM
            (
               SELECT
                  t_545.d_product_manufact_gbakc3 AS d_product_manufact_gbakc3,
                  t_545.sold_calendar_quar_gbakc4 AS sold_calendar_quar_gbakc4,
                  SAFE_CAST(NULL AS NUMERIC) AS sum_m_store_sales__gbakc5,
                  AVG(t_545.c_229) AS c_229,
                  SAFE_CAST(NULL AS NUMERIC) AS c_232,
                  t_545.d_product_manufact_gbakc1 AS d_product_manufact_gbakc1,
                  COALESCE(t_565.c_393, t_545.sold_calendar_quar_gbakc2) AS sold_calendar_quar_gbakc2
               FROM
               (
                  SELECT
                     t_513.c_385 AS c_394,
                     t_564.c_390 AS c_393
                  FROM
                  (
                     SELECT
                        CONCAT(SUBSTR(CAST(date_dim_t511.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t511.D_QOY AS STRING), 2, '0'),'-01') AS c_385
                     FROM
                        `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t511
                     WHERE
                        true
                     GROUP BY
                        1
                  ) AS t_513
                  JOIN
                  (
                     SELECT
                        MIN(t_562.c_385) AS c_390,
                        t_562.c_386 AS c_391,
                        t_563.c_388 AS c_392
                     FROM
                     (
                        SELECT
                           t_516.c_385 AS c_385,
                           t_521.c_386 AS c_386
                        FROM
                        (
                           SELECT
                              CONCAT(SUBSTR(CAST(date_dim_t514.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t514.D_QOY AS STRING), 2, '0'),'-01') AS c_385
                           FROM
                              `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t514
                           WHERE
                              true
                           GROUP BY
                              1
                        ) AS t_516
                        CROSS JOIN
                        (
                           SELECT
                              t_520.c_518 AS c_386
                           FROM
                           (
                              SELECT
                                 CONCAT(SUBSTR(CAST(date_dim_t517.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t517.D_QOY AS STRING), 2, '0'),'-01') AS c_518
                              FROM
                                 `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t517
                              WHERE
                                 CONCAT(SUBSTR(CAST(date_dim_t517.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t517.D_QOY AS STRING), 2, '0'),'-01') = '1998-02-01'
                              GROUP BY
                                 1
                           ) AS t_520
                           WHERE
                              true
                           GROUP BY
                              1
                        ) AS t_521
                        GROUP BY
                           1,
                           2
                     ) AS t_562
                     JOIN
                     (
                        SELECT
                           t_524.c_385 AS c_385,
                           t_529.c_388 AS c_388
                        FROM
                        (
                           SELECT
                              CONCAT(SUBSTR(CAST(date_dim_t522.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t522.D_QOY AS STRING), 2, '0'),'-01') AS c_385
                           FROM
                              `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t522
                           WHERE
                              true
                           GROUP BY
                              1
                        ) AS t_524
                        CROSS JOIN
                        (
                           SELECT
                              t_528.c_526 AS c_388
                           FROM
                           (
                              SELECT
                                 CONCAT(SUBSTR(CAST(date_dim_t525.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t525.D_QOY AS STRING), 2, '0'),'-01') AS c_526
                              FROM
                                 `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t525
                              WHERE
                                 CONCAT(SUBSTR(CAST(date_dim_t525.D_DATE AS STRING),1,4), '-', LPAD(CAST(date_dim_t525.D_QOY AS STRING), 2, '0'),'-01') = '1999-02-01'
                              GROUP BY
                                 1
                           ) AS t_528
                           WHERE
                              true
                           GROUP BY
                              1
                        ) AS t_529
                        GROUP BY
                           1,
                           2
                     ) AS t_563
                     ON
                        t_562.c_385 = t_563.c_385
                     GROUP BY
                        2,
                        3
                  ) AS t_564
                  ON
                  (
                        t_513.c_385 >= t_564.c_391
                     OR
                           t_564.c_391 IS NULL
                        AND
                           t_564.c_392 IS NOT NULL )
                  AND
                  (
                        t_513.c_385 <= t_564.c_392
                     OR
                           t_564.c_391 IS NOT NULL
                        AND
                           t_564.c_392 IS NULL )
                  GROUP BY
                     1,
                     2
               ) AS t_565
               JOIN
               (
                  SELECT
                     t_543.d_product_manufact_c541 AS d_product_manufact_gbakc3,
                     t_543.sold_calendar_quar_c537 AS sold_calendar_quar_gbakc4,
                     SUM(t_543.m_store_sales_pric_c538) AS c_229,
                     t_543.key_c3_c539 AS d_product_manufact_gbakc1,
                     t_543.key_c8_c540 AS sold_calendar_quar_gbakc2,
                     t_543.key_c8_c540 AS c_384
                  FROM
                  (
                     SELECT
                        as_agg_d4486ccf_q5_t534.d_product_brand_name_c12 AS d_product_brand_na_c535,
                        as_agg_d4486ccf_q5_t534.d_product_class_name_c13 AS d_product_class_na_c542,
                        as_agg_d4486ccf_q5_t534.d_product_manufacturer_id_c14 AS d_product_manufact_c541,
                        as_agg_d4486ccf_q5_t534.i_category_c10 AS i_category_c10_c536,
                        as_agg_d4486ccf_q5_t534.key_c3 AS key_c3_c539,
                        as_agg_d4486ccf_q5_t534.key_c8 AS key_c8_c540,
                        as_agg_d4486ccf_q5_t534.m_store_sales_price_c15 AS m_store_sales_pric_c538,
                        as_agg_d4486ccf_q5_t534.sold_calendar_quarter_c11 AS sold_calendar_quar_c537
                     FROM
                        `benchmark-251817`.aggregates.as_agg_d4486ccf_q53 AS as_agg_d4486ccf_q5_t534
                     WHERE
                        as_agg_d4486ccf_q5_t534.sold_calendar_quarter_c11 IN ('1998Q2', '1998Q3', '1998Q4', '1999Q1', '1999Q2')
                     AND
                     (
                              as_agg_d4486ccf_q5_t534.d_product_class_name_c13 IN ('personal', 'portable', 'reference', 'self-help')
                           AND
                              as_agg_d4486ccf_q5_t534.i_category_c10 IN ('Books', 'Children', 'Electronics')
                           AND
                              as_agg_d4486ccf_q5_t534.d_product_brand_name_c12 IN ('exportiunivamalg #9', 'scholaramalgamalg #14', 'scholaramalgamalg #7', 'scholaramalgamalg #9')
                        OR
                              as_agg_d4486ccf_q5_t534.d_product_class_name_c13 IN ('accessories', 'classical', 'fragrances', 'pants')
                           AND
                              as_agg_d4486ccf_q5_t534.i_category_c10 IN ('Women', 'Music', 'Men')
                           AND
                              as_agg_d4486ccf_q5_t534.d_product_brand_name_c12 IN ('amalgimporto #1', 'edu packscholar #1', 'exportiimporto #1', 'importoamalg #1') )
                  ) AS t_543
                  WHERE
                     true
                  GROUP BY
                     1,
                     2,
                     4,
                     5,
                     6
               ) AS t_545
               ON
                  t_565.c_394 = t_545.c_384
               GROUP BY
                  1,
                  2,
                  6,
                  7
            ) AS t_570
            JOIN
            (
               SELECT
                  t_559.d_product_manufact_c557 AS d_product_manufact_gbakc3,
                  t_559.sold_calendar_quar_c553 AS sold_calendar_quar_gbakc4,
                  SUM(t_559.m_store_sales_pric_c554) AS c_229,
                  t_559.key_c3_c555 AS d_product_manufact_gbakc1,
                  t_559.key_c8_c556 AS sold_calendar_quar_gbakc2
               FROM
               (
                  SELECT
                     as_agg_d4486ccf_q5_t550.d_product_brand_name_c12 AS d_product_brand_na_c551,
                     as_agg_d4486ccf_q5_t550.d_product_class_name_c13 AS d_product_class_na_c558,
                     as_agg_d4486ccf_q5_t550.d_product_manufacturer_id_c14 AS d_product_manufact_c557,
                     as_agg_d4486ccf_q5_t550.i_category_c10 AS i_category_c10_c552,
                     as_agg_d4486ccf_q5_t550.key_c3 AS key_c3_c555,
                     as_agg_d4486ccf_q5_t550.key_c8 AS key_c8_c556,
                     as_agg_d4486ccf_q5_t550.m_store_sales_price_c15 AS m_store_sales_pric_c554,
                     as_agg_d4486ccf_q5_t550.sold_calendar_quarter_c11 AS sold_calendar_quar_c553
                  FROM
                     `benchmark-251817`.aggregates.as_agg_d4486ccf_q53 AS as_agg_d4486ccf_q5_t550
                  WHERE
                     as_agg_d4486ccf_q5_t550.sold_calendar_quarter_c11 IN ('1998Q2', '1998Q3', '1998Q4', '1999Q1', '1999Q2')
                  AND
                  (
                           as_agg_d4486ccf_q5_t550.d_product_class_name_c13 IN ('personal', 'portable', 'reference', 'self-help')
                        AND
                           as_agg_d4486ccf_q5_t550.i_category_c10 IN ('Books', 'Children', 'Electronics')
                        AND
                           as_agg_d4486ccf_q5_t550.d_product_brand_name_c12 IN ('exportiunivamalg #9', 'scholaramalgamalg #14', 'scholaramalgamalg #7', 'scholaramalgamalg #9')
                     OR
                           as_agg_d4486ccf_q5_t550.d_product_class_name_c13 IN ('accessories', 'classical', 'fragrances', 'pants')
                        AND
                           as_agg_d4486ccf_q5_t550.i_category_c10 IN ('Women', 'Music', 'Men')
                        AND
                           as_agg_d4486ccf_q5_t550.d_product_brand_name_c12 IN ('amalgimporto #1', 'edu packscholar #1', 'exportiimporto #1', 'importoamalg #1') )
               ) AS t_559
               WHERE
                  true
               GROUP BY
                  1,
                  2,
                  4,
                  5
            ) AS t_561
            ON
               t_570.d_product_manufact_gbakc1 = t_561.d_product_manufact_gbakc1
            GROUP BY
               1,
               2,
               6,
               7
      ) AS t_572
      GROUP BY
         1,
         2,
         6,
         7
   ) AS t_573
   GROUP BY
      1,
      2,
      6,
      7
) AS t_755
WHERE
   t_755.sum_avg_quarter_sa_gbakc7 > 0.1
ORDER BY
   1 ASC,
   2 ASC,
   3 ASC
LIMIT 100

-- Q55
--
-- DDL (covered by Q52 agg)
CREATE TABLE `benchmark-251817.aggregates.as_agg_abc22c40_q52`
(
  key_c1 STRING,
  key_c2 INT64,
  key_c3 INT64,
  key_c4 INT64,
  key_c5 INT64,
  key_c6 INT64,
  key_c7 INT64,
  key_c8 INT64,
  key_c9 INT64,
  sold_calendar_year_week_c10 INT64,
  sold_d_month_of_year_c11 INT64,
  d_product_brand_id_c12 INT64,
  d_product_brand_name_c13 STRING,
  d_product_manager_id_c14 INT64,
  m_ss_ext_sales_price_sum_c15 NUMERIC,
  m_ss_ext_sales_price_sum_c16 NUMERIC,
  m_ss_ext_sales_price_sum_c17 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=be4d61ee-b831-42c7-8616-44c0d552675d */
   item_t206.i_brand AS key_c1,
   item_t206.i_manager_id AS key_c2,
   date_dim_t207.d_moy AS key_c3,
   item_t206.i_brand_id AS key_c4,
   date_dim_t207.d_year AS key_c5,
   date_dim_t207.d_moy AS key_c6,
   item_t206.i_brand_id AS key_c7,
   item_t206.i_manager_id AS key_c8,
   item_t206.i_brand_id AS key_c9,
   date_dim_t207.d_year AS sold_calendar_year_week_c10,
   date_dim_t207.d_moy AS sold_d_month_of_year_c11,
   item_t206.i_brand_id AS d_product_brand_id_c12,
   item_t206.i_brand AS d_product_brand_name_c13,
   item_t206.i_manager_id AS d_product_manager_id_c14,
   SAFE_CAST(SUM(store_sales_t205.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c15,
   SAFE_CAST(MIN(store_sales_t205.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c16,
   SAFE_CAST(MAX(store_sales_t205.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c17
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t205
JOIN
   `benchmark-251817`.TPCDS_10TB.item AS item_t206
ON
   store_sales_t205.ss_item_sk = item_t206.i_item_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t207
ON
   store_sales_t205.ss_sold_date_sk = date_dim_t207.d_date_sk
WHERE
   true
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
   11,
   12,
   13,
   14
-- AtScale Generated User Query
SELECT
/* queryId=569a5086-df7b-4cd9-b404-a2319b7e208e */
   t_90.d_product_brand_id_gbakc3 AS d_product_brand_id,
   t_90.d_product_brand_na_gbakc4 AS d_product_brand_name,
   t_90.sum_m_ss_ext_sales_gbakc5 AS sum_m_ss_ext_sales_price_sum_ok
FROM
(
   SELECT
      t_88.d_product_brand_id_c85 AS d_product_brand_id_gbakc3,
      t_88.d_product_brand_na_c87 AS d_product_brand_na_gbakc4,
      SUM(t_88.m_ss_ext_sales_pri_c86) AS sum_m_ss_ext_sales_gbakc5,
      t_88.key_c9_c82 AS d_product_brand_id_gbakc1,
      t_88.key_c4_c80 AS d_product_brand_na_gbakc2
   FROM
   (
      SELECT
         as_agg_ee954ca6_q5_t79.d_product_brand_id_c12 AS d_product_brand_id_c85,
         as_agg_ee954ca6_q5_t79.d_product_brand_name_c13 AS d_product_brand_na_c87,
         as_agg_ee954ca6_q5_t79.d_product_manager_id_c14 AS d_product_manager__c81,
         as_agg_ee954ca6_q5_t79.key_c4 AS key_c4_c80,
         as_agg_ee954ca6_q5_t79.key_c9 AS key_c9_c82,
         as_agg_ee954ca6_q5_t79.m_ss_ext_sales_price_sum_c15 AS m_ss_ext_sales_pri_c86,
         as_agg_ee954ca6_q5_t79.sold_calendar_year_week_c10 AS sold_calendar_year_c83,
         as_agg_ee954ca6_q5_t79.sold_d_month_of_year_c11 AS sold_d_month_of_ye_c84
      FROM
         `benchmark-251817`.aggregates.as_agg_ee954ca6_q52 AS as_agg_ee954ca6_q5_t79
      WHERE
         as_agg_ee954ca6_q5_t79.d_product_manager_id_c14 = 90
      AND
         as_agg_ee954ca6_q5_t79.sold_calendar_year_week_c10 = 1998
      AND
         as_agg_ee954ca6_q5_t79.sold_d_month_of_year_c11 = 12
   ) AS t_88
   WHERE
      true
   GROUP BY
      1,
      2,
      4,
      5
) AS t_90
ORDER BY
   3 DESC
LIMIT 100

-- Q56
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_aa298449_q56_q60`
(
  key_c1 NUMERIC,
  key_c2 INT64,
  key_c3 STRING,
  key_c4 INT64,
  key_c5 STRING,
  key_c6 NUMERIC,
  key_c7 INT64,
  key_c8 STRING,
  key_c9 STRING,
  key_c10 STRING,
  i_category_c11 STRING,
  sold_calendar_year_c12 INT64,
  sold_d_month_of_year_c13 INT64,
  d_customer_gmt_offset_c14 NUMERIC,
  d_i_color_c15 STRING,
  d_product_item_id_c16 STRING,
  m_cs_ext_sales_price_sum_c17 NUMERIC,
  m_cs_ext_sales_price_sum_c18 NUMERIC,
  m_cs_ext_sales_price_sum_c19 NUMERIC,
  m_ss_ext_sales_price_sum_c20 NUMERIC,
  m_ss_ext_sales_price_sum_c21 NUMERIC,
  m_ss_ext_sales_price_sum_c22 NUMERIC,
  m_ws_ext_sales_price_sum_c23 NUMERIC,
  m_ws_ext_sales_price_sum_c24 NUMERIC,
  m_ws_ext_sales_price_sum_c25 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=9561b0d3-5b9a-48de-9957-adcacd8111f8 */
   t_714.key_c1 AS key_c1,
   t_714.key_c2 AS key_c2,
   t_714.key_c3 AS key_c3,
   t_714.key_c4 AS key_c4,
   t_714.key_c5 AS key_c5,
   t_714.key_c6 AS key_c6,
   t_714.key_c7 AS key_c7,
   t_714.key_c8 AS key_c8,
   t_714.key_c9 AS key_c9,
   t_714.key_c10 AS key_c10,
   t_714.i_category_c11 AS i_category_c11,
   t_714.sold_calendar_year_c12 AS sold_calendar_year_c12,
   t_714.sold_d_month_of_year_c13 AS sold_d_month_of_year_c13,
   t_714.d_customer_gmt_offset_c14 AS d_customer_gmt_offset_c14,
   t_714.d_i_color_c15 AS d_i_color_c15,
   t_714.d_product_item_id_c16 AS d_product_item_id_c16,
   MIN(t_714.m_cs_ext_sales_price_sum_c17) AS m_cs_ext_sales_price_sum_c17,
   MIN(t_714.m_cs_ext_sales_price_sum_c18) AS m_cs_ext_sales_price_sum_c18,
   MIN(t_714.m_cs_ext_sales_price_sum_c19) AS m_cs_ext_sales_price_sum_c19,
   MIN(t_714.m_ss_ext_sales_price_sum_c20) AS m_ss_ext_sales_price_sum_c20,
   MIN(t_714.m_ss_ext_sales_price_sum_c21) AS m_ss_ext_sales_price_sum_c21,
   MIN(t_714.m_ss_ext_sales_price_sum_c22) AS m_ss_ext_sales_price_sum_c22,
   MIN(t_714.m_ws_ext_sales_price_sum_c23) AS m_ws_ext_sales_price_sum_c23,
   MIN(t_714.m_ws_ext_sales_price_sum_c24) AS m_ws_ext_sales_price_sum_c24,
   MIN(t_714.m_ws_ext_sales_price_sum_c25) AS m_ws_ext_sales_price_sum_c25
FROM
(
      SELECT
         customer_address_t482.ca_gmt_offset AS key_c1,
         date_dim_t483.d_year AS key_c2,
         item_t481.i_color AS key_c3,
         date_dim_t483.d_moy AS key_c4,
         item_t481.i_item_id AS key_c5,
         customer_address_t482.ca_gmt_offset AS key_c6,
         date_dim_t483.d_moy AS key_c7,
         item_t481.i_item_id AS key_c8,
         item_t481.i_category AS key_c9,
         item_t481.i_color AS key_c10,
         item_t481.i_category AS i_category_c11,
         date_dim_t483.d_year AS sold_calendar_year_c12,
         date_dim_t483.d_moy AS sold_d_month_of_year_c13,
         customer_address_t482.ca_gmt_offset AS d_customer_gmt_offset_c14,
         item_t481.i_color AS d_i_color_c15,
         item_t481.i_item_id AS d_product_item_id_c16,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c17,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c18,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c19,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c20,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c21,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c22,
         SAFE_CAST(SUM(web_sales_t480.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c23,
         SAFE_CAST(MIN(web_sales_t480.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c24,
         SAFE_CAST(MAX(web_sales_t480.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c25
      FROM
         `benchmark-251817`.TPCDS_10TB.web_sales AS web_sales_t480
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t481
      ON
         web_sales_t480.ws_item_sk = item_t481.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t482
      ON
         web_sales_t480.ws_ship_addr_sk = customer_address_t482.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t483
      ON
         web_sales_t480.ws_sold_date_sk = date_dim_t483.d_date_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16
   UNION ALL
      SELECT
         customer_address_t567.ca_gmt_offset AS key_c1,
         date_dim_t568.d_year AS key_c2,
         item_t565.i_color AS key_c3,
         date_dim_t568.d_moy AS key_c4,
         item_t565.i_item_id AS key_c5,
         customer_address_t567.ca_gmt_offset AS key_c6,
         date_dim_t568.d_moy AS key_c7,
         item_t565.i_item_id AS key_c8,
         item_t565.i_category AS key_c9,
         item_t565.i_color AS key_c10,
         item_t565.i_category AS i_category_c11,
         date_dim_t568.d_year AS sold_calendar_year_c12,
         date_dim_t568.d_moy AS sold_d_month_of_year_c13,
         customer_address_t567.ca_gmt_offset AS d_customer_gmt_offset_c14,
         item_t565.i_color AS d_i_color_c15,
         item_t565.i_item_id AS d_product_item_id_c16,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c17,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c18,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c19,
         SAFE_CAST(SUM(store_sales_t564.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c20,
         SAFE_CAST(MIN(store_sales_t564.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c21,
         SAFE_CAST(MAX(store_sales_t564.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c22,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c23,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c24,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c25
      FROM
         `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t564
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t565
      ON
         store_sales_t564.ss_item_sk = item_t565.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer AS customer_t566
      ON
         store_sales_t564.ss_customer_sk = customer_t566.c_customer_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t567
      ON
         customer_t566.c_current_addr_sk = customer_address_t567.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t568
      ON
         store_sales_t564.ss_sold_date_sk = date_dim_t568.d_date_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16
   UNION ALL
      SELECT
         customer_address_t651.ca_gmt_offset AS key_c1,
         date_dim_t652.d_year AS key_c2,
         item_t650.i_color AS key_c3,
         date_dim_t652.d_moy AS key_c4,
         item_t650.i_item_id AS key_c5,
         customer_address_t651.ca_gmt_offset AS key_c6,
         date_dim_t652.d_moy AS key_c7,
         item_t650.i_item_id AS key_c8,
         item_t650.i_category AS key_c9,
         item_t650.i_color AS key_c10,
         item_t650.i_category AS i_category_c11,
         date_dim_t652.d_year AS sold_calendar_year_c12,
         date_dim_t652.d_moy AS sold_d_month_of_year_c13,
         customer_address_t651.ca_gmt_offset AS d_customer_gmt_offset_c14,
         item_t650.i_color AS d_i_color_c15,
         item_t650.i_item_id AS d_product_item_id_c16,
         SAFE_CAST(SUM(catalog_sales_t649.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c17,
         SAFE_CAST(MIN(catalog_sales_t649.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c18,
         SAFE_CAST(MAX(catalog_sales_t649.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c19,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c20,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c21,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c22,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c23,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c24,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c25
      FROM
         `benchmark-251817`.TPCDS_10TB.catalog_sales AS catalog_sales_t649
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t650
      ON
         catalog_sales_t649.cs_item_sk = item_t650.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t651
      ON
         catalog_sales_t649.cs_ship_addr_sk = customer_address_t651.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t652
      ON
         catalog_sales_t649.cs_sold_date_sk = date_dim_t652.d_date_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16
) AS t_714
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
   11,
   12,
   13,
   14,
   15,
   16
-- AtScale Generated User Query
SELECT
/* queryId=29b7db24-f9fb-42fd-97c8-33ebbcf5daad */
   t_123.d_product_item_id_gbakc2 AS d_product_item_id,
   t_123.sum_total_ext_sale_gbakc3 AS sum_total__ext_sales_price_ok
FROM
(
   SELECT
      t_107.d_product_item_id__c106 AS d_product_item_id_gbakc2,
      CASE WHEN COALESCE(SUM(t_107.m_ss_ext_sales_pri_c102), SUM(t_107.m_ws_ext_sales_pri_c104), SUM(t_107.m_cs_ext_sales_pri_c98)) IS NULL THEN NULL ELSE ((COALESCE(SUM(t_107.m_ss_ext_sales_pri_c102), 0) + COALESCE(SUM(t_107.m_ws_ext_sales_pri_c104), 0)) + COALESCE(SUM(t_107.m_cs_ext_sales_pri_c98), 0)) END AS sum_total_ext_sale_gbakc3,
      t_107.key_c8_c99 AS d_product_item_id_gbakc1
   FROM
   (
      SELECT
         as_agg_fd62941b_q5_t97.d_customer_gmt_offset_c14 AS d_customer_gmt_off_c100,
         as_agg_fd62941b_q5_t97.d_i_color_c15 AS d_i_color_c15_c105,
         as_agg_fd62941b_q5_t97.d_product_item_id_c16 AS d_product_item_id__c106,
         as_agg_fd62941b_q5_t97.key_c8 AS key_c8_c99,
         as_agg_fd62941b_q5_t97.m_cs_ext_sales_price_sum_c17 AS m_cs_ext_sales_pri_c98,
         as_agg_fd62941b_q5_t97.m_ss_ext_sales_price_sum_c20 AS m_ss_ext_sales_pri_c102,
         as_agg_fd62941b_q5_t97.m_ws_ext_sales_price_sum_c23 AS m_ws_ext_sales_pri_c104,
         as_agg_fd62941b_q5_t97.sold_calendar_year_c12 AS sold_calendar_year_c103,
         as_agg_fd62941b_q5_t97.sold_d_month_of_year_c13 AS sold_d_month_of_ye_c101
      FROM
         `benchmark-251817`.aggregates.as_agg_fd62941b_q56_q60 AS as_agg_fd62941b_q5_t97
      WHERE
         as_agg_fd62941b_q5_t97.d_i_color_c15 IN ('floral', 'ivory', 'royal')
      AND
         as_agg_fd62941b_q5_t97.d_customer_gmt_offset_c14 = -5
      AND
         as_agg_fd62941b_q5_t97.sold_calendar_year_c12 = 2002
      AND
         as_agg_fd62941b_q5_t97.sold_d_month_of_year_c13 = 5
   ) AS t_107
   WHERE
      true
   GROUP BY
      1,
      3
) AS t_123
ORDER BY
   2 ASC
LIMIT 100

-- Q60
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_aa298449_q56_q60`
(
  key_c1 NUMERIC,
  key_c2 INT64,
  key_c3 STRING,
  key_c4 INT64,
  key_c5 STRING,
  key_c6 NUMERIC,
  key_c7 INT64,
  key_c8 STRING,
  key_c9 STRING,
  key_c10 STRING,
  i_category_c11 STRING,
  sold_calendar_year_c12 INT64,
  sold_d_month_of_year_c13 INT64,
  d_customer_gmt_offset_c14 NUMERIC,
  d_i_color_c15 STRING,
  d_product_item_id_c16 STRING,
  m_cs_ext_sales_price_sum_c17 NUMERIC,
  m_cs_ext_sales_price_sum_c18 NUMERIC,
  m_cs_ext_sales_price_sum_c19 NUMERIC,
  m_ss_ext_sales_price_sum_c20 NUMERIC,
  m_ss_ext_sales_price_sum_c21 NUMERIC,
  m_ss_ext_sales_price_sum_c22 NUMERIC,
  m_ws_ext_sales_price_sum_c23 NUMERIC,
  m_ws_ext_sales_price_sum_c24 NUMERIC,
  m_ws_ext_sales_price_sum_c25 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=9561b0d3-5b9a-48de-9957-adcacd8111f8 */
   t_714.key_c1 AS key_c1,
   t_714.key_c2 AS key_c2,
   t_714.key_c3 AS key_c3,
   t_714.key_c4 AS key_c4,
   t_714.key_c5 AS key_c5,
   t_714.key_c6 AS key_c6,
   t_714.key_c7 AS key_c7,
   t_714.key_c8 AS key_c8,
   t_714.key_c9 AS key_c9,
   t_714.key_c10 AS key_c10,
   t_714.i_category_c11 AS i_category_c11,
   t_714.sold_calendar_year_c12 AS sold_calendar_year_c12,
   t_714.sold_d_month_of_year_c13 AS sold_d_month_of_year_c13,
   t_714.d_customer_gmt_offset_c14 AS d_customer_gmt_offset_c14,
   t_714.d_i_color_c15 AS d_i_color_c15,
   t_714.d_product_item_id_c16 AS d_product_item_id_c16,
   MIN(t_714.m_cs_ext_sales_price_sum_c17) AS m_cs_ext_sales_price_sum_c17,
   MIN(t_714.m_cs_ext_sales_price_sum_c18) AS m_cs_ext_sales_price_sum_c18,
   MIN(t_714.m_cs_ext_sales_price_sum_c19) AS m_cs_ext_sales_price_sum_c19,
   MIN(t_714.m_ss_ext_sales_price_sum_c20) AS m_ss_ext_sales_price_sum_c20,
   MIN(t_714.m_ss_ext_sales_price_sum_c21) AS m_ss_ext_sales_price_sum_c21,
   MIN(t_714.m_ss_ext_sales_price_sum_c22) AS m_ss_ext_sales_price_sum_c22,
   MIN(t_714.m_ws_ext_sales_price_sum_c23) AS m_ws_ext_sales_price_sum_c23,
   MIN(t_714.m_ws_ext_sales_price_sum_c24) AS m_ws_ext_sales_price_sum_c24,
   MIN(t_714.m_ws_ext_sales_price_sum_c25) AS m_ws_ext_sales_price_sum_c25
FROM
(
      SELECT
         customer_address_t482.ca_gmt_offset AS key_c1,
         date_dim_t483.d_year AS key_c2,
         item_t481.i_color AS key_c3,
         date_dim_t483.d_moy AS key_c4,
         item_t481.i_item_id AS key_c5,
         customer_address_t482.ca_gmt_offset AS key_c6,
         date_dim_t483.d_moy AS key_c7,
         item_t481.i_item_id AS key_c8,
         item_t481.i_category AS key_c9,
         item_t481.i_color AS key_c10,
         item_t481.i_category AS i_category_c11,
         date_dim_t483.d_year AS sold_calendar_year_c12,
         date_dim_t483.d_moy AS sold_d_month_of_year_c13,
         customer_address_t482.ca_gmt_offset AS d_customer_gmt_offset_c14,
         item_t481.i_color AS d_i_color_c15,
         item_t481.i_item_id AS d_product_item_id_c16,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c17,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c18,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c19,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c20,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c21,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c22,
         SAFE_CAST(SUM(web_sales_t480.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c23,
         SAFE_CAST(MIN(web_sales_t480.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c24,
         SAFE_CAST(MAX(web_sales_t480.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c25
      FROM
         `benchmark-251817`.TPCDS_10TB.web_sales AS web_sales_t480
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t481
      ON
         web_sales_t480.ws_item_sk = item_t481.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t482
      ON
         web_sales_t480.ws_ship_addr_sk = customer_address_t482.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t483
      ON
         web_sales_t480.ws_sold_date_sk = date_dim_t483.d_date_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16
   UNION ALL
      SELECT
         customer_address_t567.ca_gmt_offset AS key_c1,
         date_dim_t568.d_year AS key_c2,
         item_t565.i_color AS key_c3,
         date_dim_t568.d_moy AS key_c4,
         item_t565.i_item_id AS key_c5,
         customer_address_t567.ca_gmt_offset AS key_c6,
         date_dim_t568.d_moy AS key_c7,
         item_t565.i_item_id AS key_c8,
         item_t565.i_category AS key_c9,
         item_t565.i_color AS key_c10,
         item_t565.i_category AS i_category_c11,
         date_dim_t568.d_year AS sold_calendar_year_c12,
         date_dim_t568.d_moy AS sold_d_month_of_year_c13,
         customer_address_t567.ca_gmt_offset AS d_customer_gmt_offset_c14,
         item_t565.i_color AS d_i_color_c15,
         item_t565.i_item_id AS d_product_item_id_c16,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c17,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c18,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c19,
         SAFE_CAST(SUM(store_sales_t564.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c20,
         SAFE_CAST(MIN(store_sales_t564.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c21,
         SAFE_CAST(MAX(store_sales_t564.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c22,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c23,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c24,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c25
      FROM
         `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t564
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t565
      ON
         store_sales_t564.ss_item_sk = item_t565.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer AS customer_t566
      ON
         store_sales_t564.ss_customer_sk = customer_t566.c_customer_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t567
      ON
         customer_t566.c_current_addr_sk = customer_address_t567.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t568
      ON
         store_sales_t564.ss_sold_date_sk = date_dim_t568.d_date_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16
   UNION ALL
      SELECT
         customer_address_t651.ca_gmt_offset AS key_c1,
         date_dim_t652.d_year AS key_c2,
         item_t650.i_color AS key_c3,
         date_dim_t652.d_moy AS key_c4,
         item_t650.i_item_id AS key_c5,
         customer_address_t651.ca_gmt_offset AS key_c6,
         date_dim_t652.d_moy AS key_c7,
         item_t650.i_item_id AS key_c8,
         item_t650.i_category AS key_c9,
         item_t650.i_color AS key_c10,
         item_t650.i_category AS i_category_c11,
         date_dim_t652.d_year AS sold_calendar_year_c12,
         date_dim_t652.d_moy AS sold_d_month_of_year_c13,
         customer_address_t651.ca_gmt_offset AS d_customer_gmt_offset_c14,
         item_t650.i_color AS d_i_color_c15,
         item_t650.i_item_id AS d_product_item_id_c16,
         SAFE_CAST(SUM(catalog_sales_t649.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c17,
         SAFE_CAST(MIN(catalog_sales_t649.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c18,
         SAFE_CAST(MAX(catalog_sales_t649.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c19,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c20,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c21,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c22,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c23,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c24,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c25
      FROM
         `benchmark-251817`.TPCDS_10TB.catalog_sales AS catalog_sales_t649
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t650
      ON
         catalog_sales_t649.cs_item_sk = item_t650.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t651
      ON
         catalog_sales_t649.cs_ship_addr_sk = customer_address_t651.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t652
      ON
         catalog_sales_t649.cs_sold_date_sk = date_dim_t652.d_date_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16
) AS t_714
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
   11,
   12,
   13,
   14,
   15,
   16
-- AtScale Generated User Query
SELECT
/* queryId=ba1bd0d6-37c5-4b9f-937a-07b0f52f19d2 */
   t_123.d_product_item_id_gbakc2 AS d_product_item_id,
   t_123.sum_total_ext_sale_gbakc3 AS sum_total__ext_sales_price_ok
FROM
(
   SELECT
      t_107.d_product_item_id__c106 AS d_product_item_id_gbakc2,
      CASE WHEN COALESCE(SUM(t_107.m_ss_ext_sales_pri_c103), SUM(t_107.m_ws_ext_sales_pri_c105), SUM(t_107.m_cs_ext_sales_pri_c99)) IS NULL THEN NULL ELSE ((COALESCE(SUM(t_107.m_ss_ext_sales_pri_c103), 0) + COALESCE(SUM(t_107.m_ws_ext_sales_pri_c105), 0)) + COALESCE(SUM(t_107.m_cs_ext_sales_pri_c99), 0)) END AS sum_total_ext_sale_gbakc3,
      t_107.key_c8_c100 AS d_product_item_id_gbakc1
   FROM
   (
      SELECT
         as_agg_fd62941b_q5_t97.d_customer_gmt_offset_c14 AS d_customer_gmt_off_c101,
         as_agg_fd62941b_q5_t97.d_product_item_id_c16 AS d_product_item_id__c106,
         as_agg_fd62941b_q5_t97.i_category_c11 AS i_category_c11_c98,
         as_agg_fd62941b_q5_t97.key_c8 AS key_c8_c100,
         as_agg_fd62941b_q5_t97.m_cs_ext_sales_price_sum_c17 AS m_cs_ext_sales_pri_c99,
         as_agg_fd62941b_q5_t97.m_ss_ext_sales_price_sum_c20 AS m_ss_ext_sales_pri_c103,
         as_agg_fd62941b_q5_t97.m_ws_ext_sales_price_sum_c23 AS m_ws_ext_sales_pri_c105,
         as_agg_fd62941b_q5_t97.sold_calendar_year_c12 AS sold_calendar_year_c104,
         as_agg_fd62941b_q5_t97.sold_d_month_of_year_c13 AS sold_d_month_of_ye_c102
      FROM
         `benchmark-251817`.aggregates.as_agg_fd62941b_q56_q60 AS as_agg_fd62941b_q5_t97
      WHERE
         as_agg_fd62941b_q5_t97.d_customer_gmt_offset_c14 = -6
      AND
         as_agg_fd62941b_q5_t97.sold_d_month_of_year_c13 = 9
      AND
         as_agg_fd62941b_q5_t97.i_category_c11 = 'Jewelry'
      AND
         as_agg_fd62941b_q5_t97.sold_calendar_year_c12 = 1999
   ) AS t_107
   WHERE
      true
   GROUP BY
      1,
      3
) AS t_123
ORDER BY
   1 ASC,
   2 ASC
LIMIT 100

-- Q61
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_55a90fd9_q61`
(
  key_c1 NUMERIC,
  key_c2 STRING,
  key_c3 NUMERIC,
  key_c4 STRING,
  key_c5 INT64,
  key_c6 STRING,
  key_c7 NUMERIC,
  key_c8 INT64,
  key_c9 INT64,
  key_c10 STRING,
  key_c11 STRING,
  key_c12 STRING,
  key_c13 NUMERIC,
  key_c14 STRING,
  i_category_c15 STRING,
  sold_calendar_year_week_c16 INT64,
  sold_d_month_of_year_c17 INT64,
  d_channel_direct_mail_c18 STRING,
  d_channel_email_c19 STRING,
  d_channel_tv_c20 STRING,
  d_customer_gmt_offset_c21 NUMERIC,
  d_store_gmt_offset_c22 NUMERIC,
  m_ss_ext_sales_price_prom_c23 NUMERIC,
  m_ss_ext_sales_price_prom_c24 NUMERIC,
  m_ss_ext_sales_price_prom_c25 NUMERIC,
  m_ss_ext_sales_price_sum_c26 NUMERIC,
  m_ss_ext_sales_price_sum_c27 NUMERIC,
  m_ss_ext_sales_price_sum_c28 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=ec8e1e01-4f76-4e2a-821d-749d8b7be71b */
   t_678.key_c1 AS key_c1,
   t_678.key_c2 AS key_c2,
   t_678.key_c3 AS key_c3,
   t_678.key_c4 AS key_c4,
   t_678.key_c5 AS key_c5,
   t_678.key_c6 AS key_c6,
   t_678.key_c7 AS key_c7,
   t_678.key_c8 AS key_c8,
   t_678.key_c9 AS key_c9,
   t_678.key_c10 AS key_c10,
   t_678.key_c11 AS key_c11,
   t_678.key_c12 AS key_c12,
   t_678.key_c13 AS key_c13,
   t_678.key_c14 AS key_c14,
   t_678.i_category_c15 AS i_category_c15,
   t_678.sold_calendar_year_week_c16 AS sold_calendar_year_week_c16,
   t_678.sold_d_month_of_year_c17 AS sold_d_month_of_year_c17,
   t_678.d_channel_direct_mail_c18 AS d_channel_direct_mail_c18,
   t_678.d_channel_email_c19 AS d_channel_email_c19,
   t_678.d_channel_tv_c20 AS d_channel_tv_c20,
   t_678.d_customer_gmt_offset_c21 AS d_customer_gmt_offset_c21,
   t_678.d_store_gmt_offset_c22 AS d_store_gmt_offset_c22,
   MIN(t_678.m_ss_ext_sales_price_prom_c23) AS m_ss_ext_sales_price_prom_c23,
   MIN(t_678.m_ss_ext_sales_price_prom_c24) AS m_ss_ext_sales_price_prom_c24,
   MIN(t_678.m_ss_ext_sales_price_prom_c25) AS m_ss_ext_sales_price_prom_c25,
   MIN(t_678.m_ss_ext_sales_price_sum_c26) AS m_ss_ext_sales_price_sum_c26,
   MIN(t_678.m_ss_ext_sales_price_sum_c27) AS m_ss_ext_sales_price_sum_c27,
   MIN(t_678.m_ss_ext_sales_price_sum_c28) AS m_ss_ext_sales_price_sum_c28
FROM
(
      SELECT
         store_t473.s_gmt_offset AS key_c1,
         t_483.p_channel_email_c481 AS key_c2,
         customer_address_t476.ca_gmt_offset AS key_c3,
         t_483.p_channel_tv_c480 AS key_c4,
         date_dim_t477.d_moy AS key_c5,
         t_483.p_channel_email_c481 AS key_c6,
         customer_address_t476.ca_gmt_offset AS key_c7,
         date_dim_t477.d_year AS key_c8,
         date_dim_t477.d_moy AS key_c9,
         item_t474.i_category AS key_c10,
         t_483.p_channel_dmail_c482 AS key_c11,
         t_483.p_channel_dmail_c482 AS key_c12,
         store_t473.s_gmt_offset AS key_c13,
         t_483.p_channel_tv_c480 AS key_c14,
         item_t474.i_category AS i_category_c15,
         date_dim_t477.d_year AS sold_calendar_year_week_c16,
         date_dim_t477.d_moy AS sold_d_month_of_year_c17,
         t_483.p_channel_dmail_c482 AS d_channel_direct_mail_c18,
         t_483.p_channel_email_c481 AS d_channel_email_c19,
         t_483.p_channel_tv_c480 AS d_channel_tv_c20,
         customer_address_t476.ca_gmt_offset AS d_customer_gmt_offset_c21,
         store_t473.s_gmt_offset AS d_store_gmt_offset_c22,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_prom_c23,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_prom_c24,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_prom_c25,
         SAFE_CAST(SUM(store_sales_t472.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c26,
         SAFE_CAST(MIN(store_sales_t472.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c27,
         SAFE_CAST(MAX(store_sales_t472.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c28
      FROM
         `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t472
      JOIN
         `benchmark-251817`.TPCDS_10TB.store AS store_t473
      ON
         store_sales_t472.ss_store_sk = store_t473.s_store_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t474
      ON
         store_sales_t472.ss_item_sk = item_t474.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer AS customer_t475
      ON
         store_sales_t472.ss_customer_sk = customer_t475.c_customer_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t476
      ON
         customer_t475.c_current_addr_sk = customer_address_t476.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t477
      ON
         store_sales_t472.ss_sold_date_sk = date_dim_t477.d_date_sk
      JOIN
      (
         SELECT
            promotion_t478.p_channel_dmail AS p_channel_dmail_c482,
            promotion_t478.p_channel_email AS p_channel_email_c481,
            promotion_t478.p_channel_tv AS p_channel_tv_c480,
            promotion_t478.p_promo_sk AS p_promo_sk_c479
         FROM
            `benchmark-251817`.TPCDS_10TB.promotion AS promotion_t478
         WHERE
            true
         GROUP BY
            1,
            2,
            3,
            4
      ) AS t_483
      ON
         store_sales_t472.ss_promo_sk = t_483.p_promo_sk_c479
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20,
         21,
         22
   UNION ALL
      SELECT
         store_t589.s_gmt_offset AS key_c1,
         t_598.p_channel_email_c596 AS key_c2,
         customer_address_t591.ca_gmt_offset AS key_c3,
         t_598.p_channel_tv_c595 AS key_c4,
         date_dim_t592.d_moy AS key_c5,
         t_598.p_channel_email_c596 AS key_c6,
         customer_address_t591.ca_gmt_offset AS key_c7,
         date_dim_t592.d_year AS key_c8,
         date_dim_t592.d_moy AS key_c9,
         item_t590.i_category AS key_c10,
         t_598.p_channel_dmail_c597 AS key_c11,
         t_598.p_channel_dmail_c597 AS key_c12,
         store_t589.s_gmt_offset AS key_c13,
         t_598.p_channel_tv_c595 AS key_c14,
         item_t590.i_category AS i_category_c15,
         date_dim_t592.d_year AS sold_calendar_year_week_c16,
         date_dim_t592.d_moy AS sold_d_month_of_year_c17,
         t_598.p_channel_dmail_c597 AS d_channel_direct_mail_c18,
         t_598.p_channel_email_c596 AS d_channel_email_c19,
         t_598.p_channel_tv_c595 AS d_channel_tv_c20,
         customer_address_t591.ca_gmt_offset AS d_customer_gmt_offset_c21,
         store_t589.s_gmt_offset AS d_store_gmt_offset_c22,
         SAFE_CAST(SUM(t_588.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_prom_c23,
         SAFE_CAST(MIN(t_588.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_prom_c24,
         SAFE_CAST(MAX(t_588.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_prom_c25,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c26,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c27,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c28
      FROM
      (
SELECT p.*, ss.*
FROM `benchmark-251817`.TPCDS_10TB.promotion p
INNER JOIN `benchmark-251817`.TPCDS_10TB.store_sales ss
ON ss.ss_promo_sk = p.p_promo_sk
      ) AS t_588
      JOIN
         `benchmark-251817`.TPCDS_10TB.store AS store_t589
      ON
         t_588.ss_store_sk = store_t589.s_store_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t590
      ON
         t_588.ss_item_sk = item_t590.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.customer_address AS customer_address_t591
      ON
         t_588.ss_addr_sk = customer_address_t591.ca_address_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t592
      ON
         t_588.ss_sold_date_sk = date_dim_t592.d_date_sk
      JOIN
      (
         SELECT
            promotion_t593.p_channel_dmail AS p_channel_dmail_c597,
            promotion_t593.p_channel_email AS p_channel_email_c596,
            promotion_t593.p_channel_tv AS p_channel_tv_c595,
            promotion_t593.p_promo_sk AS p_promo_sk_c594
         FROM
            `benchmark-251817`.TPCDS_10TB.promotion AS promotion_t593
         WHERE
            true
         GROUP BY
            1,
            2,
            3,
            4
      ) AS t_598
      ON
         t_588.p_promo_sk = t_598.p_promo_sk_c594
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20,
         21,
         22
) AS t_678
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
   11,
   12,
   13,
   14,
   15,
   16,
   17,
   18,
   19,
   20,
   21,
   22
-- AtScale Generated User Query
SELECT
/* queryId=69ea00fa-9701-4e16-a753-7c03c7dc3c47 */
   SUM(t_84.m_ss_ext_sales_pri_c77) AS sum_m_ss_ext_sales_price_promotion_ok,
   SUM(t_84.m_ss_ext_sales_pri_c80) AS sum_m_ss_ext_sales_price_sum_ok
FROM
(
   SELECT
      as_agg_55a90fd9_q6_t73.d_channel_direct_mail_c18 AS d_channel_direct_m_c79,
      as_agg_55a90fd9_q6_t73.d_channel_email_c19 AS d_channel_email_c1_c76,
      as_agg_55a90fd9_q6_t73.d_channel_tv_c20 AS d_channel_tv_c20_c75,
      as_agg_55a90fd9_q6_t73.d_customer_gmt_offset_c21 AS d_customer_gmt_off_c83,
      as_agg_55a90fd9_q6_t73.d_store_gmt_offset_c22 AS d_store_gmt_offset_c74,
      as_agg_55a90fd9_q6_t73.i_category_c15 AS i_category_c15_c82,
      as_agg_55a90fd9_q6_t73.m_ss_ext_sales_price_prom_c23 AS m_ss_ext_sales_pri_c77,
      as_agg_55a90fd9_q6_t73.m_ss_ext_sales_price_sum_c26 AS m_ss_ext_sales_pri_c80,
      as_agg_55a90fd9_q6_t73.sold_calendar_year_week_c16 AS sold_calendar_year_c78,
      as_agg_55a90fd9_q6_t73.sold_d_month_of_year_c17 AS sold_d_month_of_ye_c81
   FROM
      `benchmark-251817`.aggregates.as_agg_55a90fd9_q61 AS as_agg_55a90fd9_q6_t73
   WHERE
      as_agg_55a90fd9_q6_t73.d_store_gmt_offset_c22 = -6
   AND
      as_agg_55a90fd9_q6_t73.d_customer_gmt_offset_c21 = -6
   AND
      as_agg_55a90fd9_q6_t73.sold_d_month_of_year_c17 = 12
   AND
      as_agg_55a90fd9_q6_t73.sold_calendar_year_week_c16 = 1998
   AND
   (
         as_agg_55a90fd9_q6_t73.d_channel_direct_mail_c18 = 'Y'
      OR
         as_agg_55a90fd9_q6_t73.d_channel_email_c19 = 'Y'
      OR
         as_agg_55a90fd9_q6_t73.d_channel_tv_c20 = 'Y' )
   AND
      as_agg_55a90fd9_q6_t73.i_category_c15 = 'Home'
) AS t_84
WHERE
   true
LIMIT 100

-- Q71
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_50f6fad2_q71`
(
  key_c1 STRING,
  key_c2 STRING,
  key_c3 INT64,
  key_c4 INT64,
  key_c5 INT64,
  key_c6 INT64,
  key_c7 STRING,
  key_c8 INT64,
  key_c9 INT64,
  key_c10 INT64,
  key_c11 INT64,
  key_c12 INT64,
  key_c13 INT64,
  key_c14 INT64,
  key_c15 INT64,
  sold_calendar_year_c16 INT64,
  sold_d_hour_c17 INT64,
  sold_d_meal_time_c18 STRING,
  sold_d_minute_c19 INT64,
  sold_d_month_of_year_c20 INT64,
  d_product_brand_id_c21 INT64,
  d_product_brand_name_c22 STRING,
  d_product_manager_id_c23 INT64,
  m_cs_ext_sales_price_sum_c24 NUMERIC,
  m_cs_ext_sales_price_sum_c25 NUMERIC,
  m_cs_ext_sales_price_sum_c26 NUMERIC,
  m_ss_ext_sales_price_sum_c27 NUMERIC,
  m_ss_ext_sales_price_sum_c28 NUMERIC,
  m_ss_ext_sales_price_sum_c29 NUMERIC,
  m_ws_ext_sales_price_sum_c30 NUMERIC,
  m_ws_ext_sales_price_sum_c31 NUMERIC,
  m_ws_ext_sales_price_sum_c32 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=05f33b4b-a15c-4b53-a859-51cb8944455f */
   t_951.key_c1 AS key_c1,
   t_951.key_c2 AS key_c2,
   t_951.key_c3 AS key_c3,
   t_951.key_c4 AS key_c4,
   t_951.key_c5 AS key_c5,
   t_951.key_c6 AS key_c6,
   t_951.key_c7 AS key_c7,
   t_951.key_c8 AS key_c8,
   t_951.key_c9 AS key_c9,
   t_951.key_c10 AS key_c10,
   t_951.key_c11 AS key_c11,
   t_951.key_c12 AS key_c12,
   t_951.key_c13 AS key_c13,
   t_951.key_c14 AS key_c14,
   t_951.key_c15 AS key_c15,
   t_951.sold_calendar_year_c16 AS sold_calendar_year_c16,
   t_951.sold_d_hour_c17 AS sold_d_hour_c17,
   t_951.sold_d_meal_time_c18 AS sold_d_meal_time_c18,
   t_951.sold_d_minute_c19 AS sold_d_minute_c19,
   t_951.sold_d_month_of_year_c20 AS sold_d_month_of_year_c20,
   t_951.d_product_brand_id_c21 AS d_product_brand_id_c21,
   t_951.d_product_brand_name_c22 AS d_product_brand_name_c22,
   t_951.d_product_manager_id_c23 AS d_product_manager_id_c23,
   MIN(t_951.m_cs_ext_sales_price_sum_c24) AS m_cs_ext_sales_price_sum_c24,
   MIN(t_951.m_cs_ext_sales_price_sum_c25) AS m_cs_ext_sales_price_sum_c25,
   MIN(t_951.m_cs_ext_sales_price_sum_c26) AS m_cs_ext_sales_price_sum_c26,
   MIN(t_951.m_ss_ext_sales_price_sum_c27) AS m_ss_ext_sales_price_sum_c27,
   MIN(t_951.m_ss_ext_sales_price_sum_c28) AS m_ss_ext_sales_price_sum_c28,
   MIN(t_951.m_ss_ext_sales_price_sum_c29) AS m_ss_ext_sales_price_sum_c29,
   MIN(t_951.m_ws_ext_sales_price_sum_c30) AS m_ws_ext_sales_price_sum_c30,
   MIN(t_951.m_ws_ext_sales_price_sum_c31) AS m_ws_ext_sales_price_sum_c31,
   MIN(t_951.m_ws_ext_sales_price_sum_c32) AS m_ws_ext_sales_price_sum_c32
FROM
(
      SELECT
         time_dim_t644.t_meal_time AS key_c1,
         item_t642.i_brand AS key_c2,
         item_t642.i_manager_id AS key_c3,
         date_dim_t643.d_year AS key_c4,
         date_dim_t643.d_moy AS key_c5,
         item_t642.i_brand_id AS key_c6,
         time_dim_t644.t_meal_time AS key_c7,
         date_dim_t643.d_moy AS key_c8,
         time_dim_t644.t_minute AS key_c9,
         item_t642.i_brand_id AS key_c10,
         time_dim_t644.t_hour AS key_c11,
         time_dim_t644.t_hour AS key_c12,
         item_t642.i_manager_id AS key_c13,
         time_dim_t644.t_minute AS key_c14,
         item_t642.i_brand_id AS key_c15,
         date_dim_t643.d_year AS sold_calendar_year_c16,
         time_dim_t644.t_hour AS sold_d_hour_c17,
         time_dim_t644.t_meal_time AS sold_d_meal_time_c18,
         time_dim_t644.t_minute AS sold_d_minute_c19,
         date_dim_t643.d_moy AS sold_d_month_of_year_c20,
         item_t642.i_brand_id AS d_product_brand_id_c21,
         item_t642.i_brand AS d_product_brand_name_c22,
         item_t642.i_manager_id AS d_product_manager_id_c23,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c24,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c25,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c26,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c27,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c28,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c29,
         SAFE_CAST(SUM(web_sales_t641.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c30,
         SAFE_CAST(MIN(web_sales_t641.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c31,
         SAFE_CAST(MAX(web_sales_t641.ws_ext_sales_price) AS NUMERIC) AS m_ws_ext_sales_price_sum_c32
      FROM
         `benchmark-251817`.TPCDS_10TB.web_sales AS web_sales_t641
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t642
      ON
         web_sales_t641.ws_item_sk = item_t642.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t643
      ON
         web_sales_t641.ws_sold_date_sk = date_dim_t643.d_date_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.time_dim AS time_dim_t644
      ON
         web_sales_t641.ws_sold_time_sk = time_dim_t644.t_time_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20,
         21,
         22,
         23
   UNION ALL
      SELECT
         time_dim_t756.t_meal_time AS key_c1,
         item_t754.i_brand AS key_c2,
         item_t754.i_manager_id AS key_c3,
         date_dim_t755.d_year AS key_c4,
         date_dim_t755.d_moy AS key_c5,
         item_t754.i_brand_id AS key_c6,
         time_dim_t756.t_meal_time AS key_c7,
         date_dim_t755.d_moy AS key_c8,
         time_dim_t756.t_minute AS key_c9,
         item_t754.i_brand_id AS key_c10,
         time_dim_t756.t_hour AS key_c11,
         time_dim_t756.t_hour AS key_c12,
         item_t754.i_manager_id AS key_c13,
         time_dim_t756.t_minute AS key_c14,
         item_t754.i_brand_id AS key_c15,
         date_dim_t755.d_year AS sold_calendar_year_c16,
         time_dim_t756.t_hour AS sold_d_hour_c17,
         time_dim_t756.t_meal_time AS sold_d_meal_time_c18,
         time_dim_t756.t_minute AS sold_d_minute_c19,
         date_dim_t755.d_moy AS sold_d_month_of_year_c20,
         item_t754.i_brand_id AS d_product_brand_id_c21,
         item_t754.i_brand AS d_product_brand_name_c22,
         item_t754.i_manager_id AS d_product_manager_id_c23,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c24,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c25,
         SAFE_CAST(NULL AS NUMERIC) AS m_cs_ext_sales_price_sum_c26,
         SAFE_CAST(SUM(store_sales_t753.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c27,
         SAFE_CAST(MIN(store_sales_t753.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c28,
         SAFE_CAST(MAX(store_sales_t753.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c29,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c30,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c31,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c32
      FROM
         `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t753
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t754
      ON
         store_sales_t753.ss_item_sk = item_t754.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t755
      ON
         store_sales_t753.ss_sold_date_sk = date_dim_t755.d_date_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.time_dim AS time_dim_t756
      ON
         store_sales_t753.ss_sold_time_sk = time_dim_t756.t_time_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20,
         21,
         22,
         23
   UNION ALL
      SELECT
         time_dim_t868.t_meal_time AS key_c1,
         item_t866.i_brand AS key_c2,
         item_t866.i_manager_id AS key_c3,
         date_dim_t867.d_year AS key_c4,
         date_dim_t867.d_moy AS key_c5,
         item_t866.i_brand_id AS key_c6,
         time_dim_t868.t_meal_time AS key_c7,
         date_dim_t867.d_moy AS key_c8,
         time_dim_t868.t_minute AS key_c9,
         item_t866.i_brand_id AS key_c10,
         time_dim_t868.t_hour AS key_c11,
         time_dim_t868.t_hour AS key_c12,
         item_t866.i_manager_id AS key_c13,
         time_dim_t868.t_minute AS key_c14,
         item_t866.i_brand_id AS key_c15,
         date_dim_t867.d_year AS sold_calendar_year_c16,
         time_dim_t868.t_hour AS sold_d_hour_c17,
         time_dim_t868.t_meal_time AS sold_d_meal_time_c18,
         time_dim_t868.t_minute AS sold_d_minute_c19,
         date_dim_t867.d_moy AS sold_d_month_of_year_c20,
         item_t866.i_brand_id AS d_product_brand_id_c21,
         item_t866.i_brand AS d_product_brand_name_c22,
         item_t866.i_manager_id AS d_product_manager_id_c23,
         SAFE_CAST(SUM(catalog_sales_t865.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c24,
         SAFE_CAST(MIN(catalog_sales_t865.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c25,
         SAFE_CAST(MAX(catalog_sales_t865.cs_ext_sales_price) AS NUMERIC) AS m_cs_ext_sales_price_sum_c26,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c27,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c28,
         SAFE_CAST(NULL AS NUMERIC) AS m_ss_ext_sales_price_sum_c29,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c30,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c31,
         SAFE_CAST(NULL AS NUMERIC) AS m_ws_ext_sales_price_sum_c32
      FROM
         `benchmark-251817`.TPCDS_10TB.catalog_sales AS catalog_sales_t865
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t866
      ON
         catalog_sales_t865.cs_item_sk = item_t866.i_item_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t867
      ON
         catalog_sales_t865.cs_sold_date_sk = date_dim_t867.d_date_sk
      JOIN
         `benchmark-251817`.TPCDS_10TB.time_dim AS time_dim_t868
      ON
         catalog_sales_t865.cs_sold_time_sk = time_dim_t868.t_time_sk
      WHERE
         true
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
         11,
         12,
         13,
         14,
         15,
         16,
         17,
         18,
         19,
         20,
         21,
         22,
         23
) AS t_951
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
   11,
   12,
   13,
   14,
   15,
   16,
   17,
   18,
   19,
   20,
   21,
   22,
   23
-- AtScale Generated User Query
SELECT
/* queryId=05017d7d-9b87-4948-a8de-a3fa06c0d74a */
   t_210.d_product_brand_id_gbakc5 AS d_product_brand_id,
   t_210.d_product_brand_na_gbakc6 AS d_product_brand_name,
   t_210.sold_d_hour_gbakc7 AS sold_d_hour,
   t_210.sold_d_minute_gbakc8 AS sold_d_minute,
   t_210.sum_total_ext_sale_gbakc9 AS sum_total__ext_sales_price_ok
FROM
(
   SELECT
      t_185.d_product_brand_id_c181 AS d_product_brand_id_gbakc5,
      t_185.d_product_brand_na_c172 AS d_product_brand_na_gbakc6,
      t_185.sold_d_hour_c17_c174 AS sold_d_hour_gbakc7,
      t_185.sold_d_minute_c19_c182 AS sold_d_minute_gbakc8,
      CASE WHEN COALESCE(SUM(t_185.m_ss_ext_sales_pri_c177), SUM(t_185.m_ws_ext_sales_pri_c179), SUM(t_185.m_cs_ext_sales_pri_c171)) IS NULL THEN NULL ELSE ((COALESCE(SUM(t_185.m_ss_ext_sales_pri_c177), 0) + COALESCE(SUM(t_185.m_ws_ext_sales_pri_c179), 0)) + COALESCE(SUM(t_185.m_cs_ext_sales_pri_c171), 0)) END AS sum_total_ext_sale_gbakc9,
      t_185.key_c15_c178 AS d_product_brand_id_gbakc1,
      t_185.key_c6_c173 AS d_product_brand_na_gbakc2,
      t_185.key_c11_c175 AS sold_d_hour_gbakc3,
      t_185.key_c14_c170 AS sold_d_minute_gbakc4
   FROM
   (
      SELECT
         as_agg_8d5eeec3_q7_t169.d_product_brand_id_c21 AS d_product_brand_id_c181,
         as_agg_8d5eeec3_q7_t169.d_product_brand_name_c22 AS d_product_brand_na_c172,
         as_agg_8d5eeec3_q7_t169.d_product_manager_id_c23 AS d_product_manager__c180,
         as_agg_8d5eeec3_q7_t169.key_c11 AS key_c11_c175,
         as_agg_8d5eeec3_q7_t169.key_c14 AS key_c14_c170,
         as_agg_8d5eeec3_q7_t169.key_c15 AS key_c15_c178,
         as_agg_8d5eeec3_q7_t169.key_c4 AS key_c4_c184,
         as_agg_8d5eeec3_q7_t169.key_c6 AS key_c6_c173,
         as_agg_8d5eeec3_q7_t169.m_cs_ext_sales_price_sum_c24 AS m_cs_ext_sales_pri_c171,
         as_agg_8d5eeec3_q7_t169.m_ss_ext_sales_price_sum_c27 AS m_ss_ext_sales_pri_c177,
         as_agg_8d5eeec3_q7_t169.m_ws_ext_sales_price_sum_c30 AS m_ws_ext_sales_pri_c179,
         as_agg_8d5eeec3_q7_t169.sold_d_hour_c17 AS sold_d_hour_c17_c174,
         as_agg_8d5eeec3_q7_t169.sold_d_meal_time_c18 AS sold_d_meal_time_c_c176,
         as_agg_8d5eeec3_q7_t169.sold_d_minute_c19 AS sold_d_minute_c19_c182,
         as_agg_8d5eeec3_q7_t169.sold_d_month_of_year_c20 AS sold_d_month_of_ye_c183
      FROM
         `benchmark-251817`.aggregates.as_agg_8d5eeec3_q71 AS as_agg_8d5eeec3_q7_t169
      WHERE
         as_agg_8d5eeec3_q7_t169.d_product_manager_id_c23 = 1
      AND
         as_agg_8d5eeec3_q7_t169.sold_d_month_of_year_c20 = 12
      AND
         as_agg_8d5eeec3_q7_t169.sold_d_meal_time_c18 IN ('breakfast', 'dinner')
   ) AS t_185
   JOIN
   (
      SELECT
         date_dim_t186.d_year AS d_year_c187
      FROM
         `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t186
      WHERE
         date_dim_t186.d_year = 1998
      GROUP BY
         1
   ) AS t_188
   ON
      t_185.key_c4_c184 = t_188.d_year_c187
   WHERE
      true
   GROUP BY
      1,
      2,
      3,
      4,
      6,
      7,
      8,
      9
) AS t_210
ORDER BY
   5 DESC,
   1 ASC
LIMIT 100

-- Q88
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_15d90649_q88`
(
  key_c1 INT64,
  key_c2 STRING,
  key_c3 STRING,
  key_c4 INT64,
  key_c5 STRING,
  key_c6 INT64,
  key_c7 INT64,
  key_c8 STRING,
  sold_d_morning_time_tier_c9 STRING,
  d_hd_dep_count_c10 INT64,
  d_hd_vehicle_count_c11 INT64,
  d_store_name_c12 STRING,
  m_ss_row_counter_sum_c13 INT64,
  m_ss_row_counter_sum_c14 INT64,
  m_ss_row_counter_sum_c15 INT64
);
-- AtScale Agg Creation Query
SELECT
/* queryId=16a2c28f-bcc8-4c00-bee1-d9e8ffb9a022 */
   household_demograp_t183.hd_dep_count AS key_c1,
   store_t184.s_store_name AS key_c2,
   store_t184.s_store_name AS key_c3,
   household_demograp_t183.hd_vehicle_count AS key_c4,
   CASE
WHEN time_dim_t185.T_HOUR = 8 AND time_dim_t185.T_MINUTE >= 30 THEN '08:30 to 09:00'
WHEN time_dim_t185.T_HOUR = 9 AND time_dim_t185.T_MINUTE < 30 THEN '09:00 to 09:30'
WHEN time_dim_t185.T_HOUR = 9 AND time_dim_t185.T_MINUTE >= 30 THEN '09:30 to 10:00'
WHEN time_dim_t185.T_HOUR = 10 AND time_dim_t185.T_MINUTE < 30 THEN '10:00 to 10:30'
WHEN time_dim_t185.T_HOUR = 10 AND time_dim_t185.T_MINUTE >= 30 THEN '10:30 to 11:00'
WHEN time_dim_t185.T_HOUR = 11 AND time_dim_t185.T_MINUTE < 30 THEN '11:00 to 11:30'
WHEN time_dim_t185.T_HOUR = 11 AND time_dim_t185.T_MINUTE >= 30 THEN '11:30 to 12:00'
WHEN time_dim_t185.T_HOUR = 12 AND time_dim_t185.T_MINUTE < 30 THEN '12:00 to 12:30'
ELSE
'Other'
END AS key_c5,
   household_demograp_t183.hd_dep_count AS key_c6,
   household_demograp_t183.hd_vehicle_count AS key_c7,
   CASE
WHEN time_dim_t185.T_HOUR = 8 AND time_dim_t185.T_MINUTE >= 30 THEN '08:30 to 09:00'
WHEN time_dim_t185.T_HOUR = 9 AND time_dim_t185.T_MINUTE < 30 THEN '09:00 to 09:30'
WHEN time_dim_t185.T_HOUR = 9 AND time_dim_t185.T_MINUTE >= 30 THEN '09:30 to 10:00'
WHEN time_dim_t185.T_HOUR = 10 AND time_dim_t185.T_MINUTE < 30 THEN '10:00 to 10:30'
WHEN time_dim_t185.T_HOUR = 10 AND time_dim_t185.T_MINUTE >= 30 THEN '10:30 to 11:00'
WHEN time_dim_t185.T_HOUR = 11 AND time_dim_t185.T_MINUTE < 30 THEN '11:00 to 11:30'
WHEN time_dim_t185.T_HOUR = 11 AND time_dim_t185.T_MINUTE >= 30 THEN '11:30 to 12:00'
WHEN time_dim_t185.T_HOUR = 12 AND time_dim_t185.T_MINUTE < 30 THEN '12:00 to 12:30'
ELSE
'Other'
END AS key_c8,
   CASE
WHEN time_dim_t185.T_HOUR = 8 AND time_dim_t185.T_MINUTE >= 30 THEN '08:30 to 09:00'
WHEN time_dim_t185.T_HOUR = 9 AND time_dim_t185.T_MINUTE < 30 THEN '09:00 to 09:30'
WHEN time_dim_t185.T_HOUR = 9 AND time_dim_t185.T_MINUTE >= 30 THEN '09:30 to 10:00'
WHEN time_dim_t185.T_HOUR = 10 AND time_dim_t185.T_MINUTE < 30 THEN '10:00 to 10:30'
WHEN time_dim_t185.T_HOUR = 10 AND time_dim_t185.T_MINUTE >= 30 THEN '10:30 to 11:00'
WHEN time_dim_t185.T_HOUR = 11 AND time_dim_t185.T_MINUTE < 30 THEN '11:00 to 11:30'
WHEN time_dim_t185.T_HOUR = 11 AND time_dim_t185.T_MINUTE >= 30 THEN '11:30 to 12:00'
WHEN time_dim_t185.T_HOUR = 12 AND time_dim_t185.T_MINUTE < 30 THEN '12:00 to 12:30'
ELSE
'Other'
END AS sold_d_morning_time_tier_c9,
   household_demograp_t183.hd_dep_count AS d_hd_dep_count_c10,
   household_demograp_t183.hd_vehicle_count AS d_hd_vehicle_count_c11,
   store_t184.s_store_name AS d_store_name_c12,
   SAFE_CAST(SUM(1) AS INT64) AS m_ss_row_counter_sum_c13,
   SAFE_CAST(MIN(1) AS INT64) AS m_ss_row_counter_sum_c14,
   SAFE_CAST(MAX(1) AS INT64) AS m_ss_row_counter_sum_c15
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t181
JOIN
   `benchmark-251817`.TPCDS_10TB.household_demographics AS household_demograp_t183
ON
   store_sales_t181.ss_hdemo_sk = household_demograp_t183.hd_demo_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.store AS store_t184
ON
   store_sales_t181.ss_store_sk = store_t184.s_store_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.time_dim AS time_dim_t185
ON
   store_sales_t181.ss_sold_time_sk = time_dim_t185.t_time_sk
WHERE
   true
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
   11,
   12
-- AtScale Generated User Query
SELECT
/* queryId=fd84cf41-4b9f-414e-996e-1bec1d98d693 */
   t_86.sold_d_morning_tim_gbakc2 AS sold_d_morning__time_tier,
   t_86.sum_m_ss_row_count_gbakc3 AS sum_m_ss_row_counter_sum_ok
FROM
(
   SELECT
      t_84.sold_d_morning_tim_c80 AS sold_d_morning_tim_gbakc2,
      SUM(t_84.m_ss_row_counter_s_c82) AS sum_m_ss_row_count_gbakc3,
      t_84.key_c8_c83 AS sold_d_morning_tim_gbakc1
   FROM
   (
      SELECT
         as_agg_a4c58df1_q8_t77.d_hd_dep_count_c10 AS d_hd_dep_count_c10_c79,
         as_agg_a4c58df1_q8_t77.d_hd_vehicle_count_c11 AS d_hd_vehicle_count_c81,
         as_agg_a4c58df1_q8_t77.d_store_name_c12 AS d_store_name_c12_c78,
         as_agg_a4c58df1_q8_t77.key_c8 AS key_c8_c83,
         as_agg_a4c58df1_q8_t77.m_ss_row_counter_sum_c13 AS m_ss_row_counter_s_c82,
         as_agg_a4c58df1_q8_t77.sold_d_morning_time_tier_c9 AS sold_d_morning_tim_c80
      FROM
         `benchmark-251817`.aggregates.as_agg_a4c58df1_q88 AS as_agg_a4c58df1_q8_t77
      WHERE
         as_agg_a4c58df1_q8_t77.sold_d_morning_time_tier_c9 <> 'Other'
      AND
      (
               as_agg_a4c58df1_q8_t77.d_hd_dep_count_c10 = 2
            AND
               as_agg_a4c58df1_q8_t77.d_hd_vehicle_count_c11 <= 4
         OR
               as_agg_a4c58df1_q8_t77.d_hd_dep_count_c10 = 0
            AND
               as_agg_a4c58df1_q8_t77.d_hd_vehicle_count_c11 <= 2
         OR
               as_agg_a4c58df1_q8_t77.d_hd_dep_count_c10 = -1
            AND
               as_agg_a4c58df1_q8_t77.d_hd_vehicle_count_c11 <= 1 )
      AND
         as_agg_a4c58df1_q8_t77.d_store_name_c12 = 'ese'
   ) AS t_84
   WHERE
      true
   GROUP BY
      1,
      3
) AS t_86

-- Q96
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_da161d3f_q96`
(
  key_c1 INT64,
  key_c2 STRING,
  key_c3 STRING,
  key_c4 INT64,
  key_c5 INT64,
  key_c6 INT64,
  key_c7 INT64,
  key_c8 INT64,
  sold_d_hour_c9 INT64,
  sold_d_minute_c10 INT64,
  d_hd_dep_count_c11 INT64,
  d_store_name_c12 STRING,
  m_ss_row_counter_sum_c13 INT64,
  m_ss_row_counter_sum_c14 INT64,
  m_ss_row_counter_sum_c15 INT64
);
-- AtScale Agg Creation Query
SELECT
/* queryId=e55bce72-bd38-4b73-a9db-d3ebf363cb78 */
   household_demograp_t183.hd_dep_count AS key_c1,
   store_t184.s_store_name AS key_c2,
   store_t184.s_store_name AS key_c3,
   household_demograp_t183.hd_dep_count AS key_c4,
   time_dim_t185.t_minute AS key_c5,
   time_dim_t185.t_hour AS key_c6,
   time_dim_t185.t_hour AS key_c7,
   time_dim_t185.t_minute AS key_c8,
   time_dim_t185.t_hour AS sold_d_hour_c9,
   time_dim_t185.t_minute AS sold_d_minute_c10,
   household_demograp_t183.hd_dep_count AS d_hd_dep_count_c11,
   store_t184.s_store_name AS d_store_name_c12,
   SAFE_CAST(SUM(1) AS INT64) AS m_ss_row_counter_sum_c13,
   SAFE_CAST(MIN(1) AS INT64) AS m_ss_row_counter_sum_c14,
   SAFE_CAST(MAX(1) AS INT64) AS m_ss_row_counter_sum_c15
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t181
JOIN
   `benchmark-251817`.TPCDS_10TB.household_demographics AS household_demograp_t183
ON
   store_sales_t181.ss_hdemo_sk = household_demograp_t183.hd_demo_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.store AS store_t184
ON
   store_sales_t181.ss_store_sk = store_t184.s_store_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.time_dim AS time_dim_t185
ON
   store_sales_t181.ss_sold_time_sk = time_dim_t185.t_time_sk
WHERE
   true
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
   11,
   12
-- AtScale Generated User Query
SELECT
/* queryId=52d254c8-930e-4835-b9f0-e298d6b8cbfe */
   SUM(t_43.m_ss_row_counter_s_c42) AS sum_m_ss_row_counter_sum_ok
FROM
(
   SELECT
      as_agg_9d251710_q9_t37.d_hd_dep_count_c11 AS d_hd_dep_count_c11_c40,
      as_agg_9d251710_q9_t37.d_store_name_c12 AS d_store_name_c12_c39,
      as_agg_9d251710_q9_t37.m_ss_row_counter_sum_c13 AS m_ss_row_counter_s_c42,
      as_agg_9d251710_q9_t37.sold_d_hour_c9 AS sold_d_hour_c9_c41,
      as_agg_9d251710_q9_t37.sold_d_minute_c10 AS sold_d_minute_c10_c38
   FROM
      `benchmark-251817`.aggregates.as_agg_9d251710_q96 AS as_agg_9d251710_q9_t37
   WHERE
      as_agg_9d251710_q9_t37.d_store_name_c12 = 'ese'
   AND
      as_agg_9d251710_q9_t37.d_hd_dep_count_c11 = 5
   AND
      as_agg_9d251710_q9_t37.sold_d_hour_c9 = 8
   AND
      as_agg_9d251710_q9_t37.sold_d_minute_c10 >= 30
) AS t_43
WHERE
   true
ORDER BY
   1 ASC
LIMIT 100

-- Q98
--
-- DDL
CREATE TABLE `benchmark-251817.aggregates.as_agg_6bed8fce_q98`
(
  key_c1 STRING,
  key_c2 INT64,
  key_c3 STRING,
  key_c4 NUMERIC,
  key_c5 INT64,
  key_c6 NUMERIC,
  key_c7 STRING,
  i_category_c8 STRING,
  product_dimension_c9 STRING,
  sold_time_dimension_c10 DATE,
  d_product_class_name_c11 STRING,
  d_product_current_price_c12 NUMERIC,
  m_ss_ext_sales_price_sum_c13 NUMERIC,
  m_ss_ext_sales_price_sum_c14 NUMERIC,
  m_ss_ext_sales_price_sum_c15 NUMERIC
);
-- AtScale Agg Creation Query
SELECT
/* queryId=57bb46d7-dfce-4c1b-8fb7-75c85636be5d */
   item_t182.i_class AS key_c1,
   date_dim_t183.d_date_sk AS key_c2,
   item_t182.i_category AS key_c3,
   item_t182.i_current_price AS key_c4,
   item_t182.i_item_sk AS key_c5,
   item_t182.i_current_price AS key_c6,
   item_t182.i_class AS key_c7,
   item_t182.i_category AS i_category_c8,
   item_t182.i_item_desc AS product_dimension_c9,
   date_dim_t183.d_date AS sold_time_dimension_c10,
   item_t182.i_class AS d_product_class_name_c11,
   item_t182.i_current_price AS d_product_current_price_c12,
   SAFE_CAST(SUM(store_sales_t181.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c13,
   SAFE_CAST(MIN(store_sales_t181.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c14,
   SAFE_CAST(MAX(store_sales_t181.ss_ext_sales_price) AS NUMERIC) AS m_ss_ext_sales_price_sum_c15
FROM
   `benchmark-251817`.TPCDS_10TB.store_sales AS store_sales_t181
JOIN
   `benchmark-251817`.TPCDS_10TB.item AS item_t182
ON
   store_sales_t181.ss_item_sk = item_t182.i_item_sk
JOIN
   `benchmark-251817`.TPCDS_10TB.date_dim AS date_dim_t183
ON
   store_sales_t181.ss_sold_date_sk = date_dim_t183.d_date_sk
WHERE
   true
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
   11,
   12
-- AtScale Generated User Query
SELECT
/* queryId=618b3597-b173-4518-87ce-f5cbd610ce9d */
   t_1.d_product_item_id AS d_product_item_id,
   t_1.product_dimension_2L25VBN54RCLX7B3 AS product_dimension,
   t_1.i_category_GK4267MPMJ2C54B4 AS i_category,
   t_1.d_product_class_name AS d_product_class_name,
   t_1.d_product_current_price AS d_product_current_price,
   SUM(CASE WHEN t_162.x_measure__0 = 0 THEN NULL ELSE CASE WHEN t_162.x_measure__0 = 0 THEN NULL ELSE ((100 * t_1.m_ss_ext_sales_price_sum) / t_162.x_measure__0) END END) AS sum_calculation_6026871858440298504_ok,
   SUM(t_1.m_ss_ext_sales_price_sum) AS sum_m_ss_ext_sales_price_sum_ok
FROM
(
   SELECT
      t_161.i_category_gbakc7 AS i_category_GK4267MPMJ2C54B4,
      t_161.d_product_item_id_gbakc8 AS d_product_item_id,
      t_161.m_ss_ext_sales_pri_gbakc9 AS m_ss_ext_sales_price_sum,
      t_161.d_product_current__gbakc10 AS d_product_current_price,
      t_161.d_product_class_na_gbakc11 AS d_product_class_name,
      t_161.sold_time_dimensio_gbakc12 AS sold_time_dimension_PPDRIHYSTF436QN3,
      t_161.product_dimension_gbakc13 AS product_dimension_2L25VBN54RCLX7B3
   FROM
   (
      SELECT
         as_agg_6bed8fce_q9_t158.i_category_c8 AS i_category_gbakc7,
         item_t159.i_item_id AS d_product_item_id_gbakc8,
         SUM(as_agg_6bed8fce_q9_t158.m_ss_ext_sales_price_sum_c13) AS m_ss_ext_sales_pri_gbakc9,
         as_agg_6bed8fce_q9_t158.d_product_current_price_c12 AS d_product_current__gbakc10,
         as_agg_6bed8fce_q9_t158.d_product_class_name_c11 AS d_product_class_na_gbakc11,
         as_agg_6bed8fce_q9_t158.sold_time_dimension_c10 AS sold_time_dimensio_gbakc12,
         as_agg_6bed8fce_q9_t158.product_dimension_c9 AS product_dimension_gbakc13,
         as_agg_6bed8fce_q9_t158.key_c3 AS i_category_gbakc1,
         item_t159.i_item_id AS d_product_item_id_gbakc2,
         as_agg_6bed8fce_q9_t158.key_c4 AS d_product_current__gbakc3,
         as_agg_6bed8fce_q9_t158.key_c1 AS d_product_class_na_gbakc4,
         as_agg_6bed8fce_q9_t158.key_c2 AS sold_time_dimensio_gbakc5,
         as_agg_6bed8fce_q9_t158.key_c5 AS product_dimension_gbakc6
      FROM
         `benchmark-251817`.aggregates.as_agg_6bed8fce_q98 AS as_agg_6bed8fce_q9_t158
      JOIN
         `benchmark-251817`.TPCDS_10TB.item AS item_t159
      ON
         as_agg_6bed8fce_q9_t158.key_c5 = item_t159.i_item_sk
      WHERE
         true
      GROUP BY
         1,
         2,
         4,
         5,
         6,
         7,
         8,
         9,
         10,
         11,
         12,
         13
   ) AS t_161
) AS t_1
JOIN
(
   SELECT
      t_219.d_product_class_na_gbakc16 AS d_product_class_name,
      t_219.x_measure_0_gbakc17 AS x_measure__0
   FROM
   (
      SELECT
         t_217.d_product_class_na_c212 AS d_product_class_na_gbakc16,
         SUM(t_217.m_ss_ext_sales_pri_c216) AS x_measure_0_gbakc17,
         t_217.key_c1_c214 AS d_product_class_na_gbakc15
      FROM
      (
         SELECT
            as_agg_6bed8fce_q9_t211.d_product_class_name_c11 AS d_product_class_na_c212,
            as_agg_6bed8fce_q9_t211.i_category_c8 AS i_category_c8_c215,
            as_agg_6bed8fce_q9_t211.key_c1 AS key_c1_c214,
            as_agg_6bed8fce_q9_t211.m_ss_ext_sales_price_sum_c13 AS m_ss_ext_sales_pri_c216,
            as_agg_6bed8fce_q9_t211.sold_time_dimension_c10 AS sold_time_dimensio_c213
         FROM
            `benchmark-251817`.aggregates.as_agg_6bed8fce_q98 AS as_agg_6bed8fce_q9_t211
         WHERE
            as_agg_6bed8fce_q9_t211.i_category_c8 IN ('Electronics', 'Shoes', 'Women')
         AND
            as_agg_6bed8fce_q9_t211.sold_time_dimension_c10 BETWEEN '2002-05-27' AND '2002-06-26'
      ) AS t_217
      WHERE
         true
      GROUP BY
         1,
         3
   ) AS t_219
) AS t_162
ON
   t_1.d_product_class_name = t_162.d_product_class_name
WHERE
   t_1.d_product_class_name IS NOT NULL
AND
   t_1.product_dimension_2L25VBN54RCLX7B3 IS NOT NULL
AND
   t_1.i_category_GK4267MPMJ2C54B4 IN ('Electronics', 'Shoes', 'Women')
AND
   t_1.sold_time_dimension_PPDRIHYSTF436QN3 BETWEEN '2002-05-27' AND '2002-06-26'
GROUP BY
   1,
   2,
   3,
   4,
   5
ORDER BY
   3 ASC,
   4 ASC,
   1 ASC,
   2 ASC,
   7 ASC
LIMIT 100