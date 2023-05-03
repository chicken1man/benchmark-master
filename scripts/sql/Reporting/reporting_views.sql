CREATE OR REPLACE VIEW
  `benchmark-251817.benchmark.benchmark_costs` AS
SELECT
  'On Demand' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  SUM(1*(28.888096/20)) AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('BigQuery.2019Q3' )
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'On Demand' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  SUM(1*(.000713/20)) AS run_cost,
  MAX(243.24) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.BigQuery.2019Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Fixed Pricing-Slots' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (40000/30/24)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('BigQuery.2019Q3')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Fixed Pricing-Slots' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  ((40000/30/24)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((54/60)*(40000/30/24)) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.BigQuery.2019Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Fixed Pricing-Slots' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (40000/30/24)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('BigQuery.2021Q2.NoBIEngine')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Fixed Pricing-Slots' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (40000/30/24)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('BigQuery.Cardinal')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
    'Fixed Pricing-Slots' AS pricing_type,
    run_label,
    platform,
    threads,
    SUM(elapsed) AS elapsed,
    (40000/30/24)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
    MAX(0) AS agg_cost
FROM
    `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
        run_label IN ('Tyson.NoAtScale.2023Q1','Tyson.YesAtScale.2023Q1')
GROUP BY
    1,
    2,
    3,
    4
UNION ALL
SELECT
  'Fixed Pricing-Slots' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  ((40000/30/24)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((34/60)*(40000/30/24)) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.BigQuery.2021Q2.NoBIEngine')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Fixed Pricing-Slots' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  ((40000/30/24)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((2/60)*(40000/30/24)) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.BigQuery.Cardinal')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (4.80*6)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('Redshift.2019Q3')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  ((4.80*6)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((112/60)*(4.80*6)) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Redshift.2019Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (4.80*6)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('Redshift.2021Q3')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  ((4.80*6)*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((34/60)*(4.80*6)) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Redshift.2021Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  45.30*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('Synapse.2020Q3')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (45.30*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((67/60)*45.30) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Synapse.2020Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  45.30*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('Synapse.2021Q3')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (45.30*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((82/60)*45.30) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Synapse.2021Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  72.41*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('Databricks.2020Q3')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (37.93*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((300/60)*37.93) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Databricks.2020Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  59.84*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60 AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('Databricks.SQL.3XL.2022Q1')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (8.80*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((27/60)*59.84) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Databricks.SQL.Large.2022Q1')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (17.60*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((27/60)*59.84) as agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Databricks.SQL.XLarge.2022Q1')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (64*2.00*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('SnowFlake.2019Q3')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (8*2*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((8*2.00*(247/60))) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Snowflake.2019Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (64*2.00*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX(0) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('SnowFlake.2021Q3')
GROUP BY
  1,
  2,
  3,
  4
UNION ALL
SELECT
  'Consumption Time' AS pricing_type,
  run_label,
  platform,
  threads,
  SUM(elapsed) AS elapsed,
  (16*2.00*TIMESTAMP_DIFF(MAX(TIMESTAMP_MILLIS(timestamp)), MIN(TIMESTAMP_MILLIS(timestamp)), SECOND)/60/60) AS run_cost,
  MAX((16*2.00*(23/60))) AS agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed`
WHERE
  run_label IN ('AtScale.Snowflake.2021Q3')
  AND CAST(threads AS NUMERIC) < 100
GROUP BY
  1,
  2,
  3,
  4;

CREATE OR REPLACE VIEW `benchmark-251817.benchmark.benchmark_results_parsed_with_costs` AS
SELECT
  p.*,
  c.pricing_type,
  c.run_cost*(p.elapsed/c.elapsed) AS run_cost,
  c.agg_cost
FROM
  `benchmark-251817.benchmark.benchmark_results_parsed` p
LEFT OUTER JOIN
  `benchmark-251817.benchmark.benchmark_costs` c
ON
  p.run_label = c.run_label
  AND p.platform = c.platform
  AND p.threads = c.threads;
