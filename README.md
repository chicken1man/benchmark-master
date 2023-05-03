# AtScale Cloud Data Warehouse Benchmark Project
Instructions and source code to replicate the AtScale Cloud Data Warehouse Benchmark for the following data platforms:
1. Snowflake
2. Google BigQuery
3. Redshift
4. Azure Synapse SQL
5. Azure Databricks
6. Databricks SQL

## Overview
The enterprise has entered into a new era of data warehousing. Driven by the increasing popularity of the public cloud, new data warehouse technologies are making inroads into the traditional on-premise data warehouse market. By offering customers the power of a relational, scale-out data platform without the overhead of managing it, cloud data warehouses promise to make more data available at a lower cost with fewer data management headaches.

In this inaugural cloud data warehouse benchmark analysis, we set out to quantify vendor benefits while comparing and contrasting the most popular offerings.
Using the standard TPC-DS (10TB) benchmarking framework, we set out to test the performance
and scalability boundaries of the various options. In addition, we also examined the operational cost dimension and we challenged the traditional data modeling techniques by testing an alternative to raw TPC-DS SQL.

In summary, we focused our testing on the following 4 areas:

1. Query Performance: How fast can the cloud data warehouse return results for a single user?
2. User concurrency: How do multiple users running simultaneous queries affect system performance and stability?
3. Compute Cost: How do query workloads and configuration affect your monthly cloud bill?
4. Semantic Complexity: How difficult is it to write a SQL query to answer the TPC-DS business question?

## Required Software

1. JMeter 5.x or higher
2. AtScale

## Directory Structure

1. `/cube` - AtScale XML cube definition files
2. `/query_results`	- CSV file outputs of TPC-DS queries (for Raw and AtScale)
3. `/scripts`	- JMeter, Shell, SQL scripts and results data loading JAR for environment set up and execution
4. `/workbooks` - BI Tool example workbooks that generated the AtScale TPC-DS queries against the model

## Instructions for running a benchmark

1. Provision the data platform instance using the specfications defined in the file `/configurations/TPC-DS Benchmark DW Configurations.pdf`
2. Using the table DDL scripts in the `/scripts/sql/DDL` directory, create the tables, load the data & analyze the tables
3. Set up an AtScale instance, configure it with the following settings:
   1. aggregates.create.joins.maximumKeyCardinality = 200000000
   2. Enable 'Secondary Metrical Attributes (Experimental)' in Settings/Options
   3. Set ‘Maximum number of concurrent builds’ to 4 (in Settings/Aggregates)
   4. connection.pool.getStateRequest.timeout = 12.hours (in Settings/Engine/Show Custom Settings)
   5. datasource.queries.useSmallQueryRole = false
   6. jobs.aggregates.watermarker.enabled = false
   7. jobs.aggregates.invalidProjectCheck.frequency = 24.hours
   8. jobs.aggregates.watermarker.frequency = 24.hours
   9. CONNECTION.POOL.GROUP.MAXCONNECTIONS = 100
   10. CONNECTION.POOL.USER.MAXCONNECTIONS = 100
   11. query.includeComments.general.queryId = true (to bust query cache on target DW)
   12. tables.create.partitions.allowIncompleteEstimates.enabled = true
   13. tables.create.partitions.maximumEstimatedNumberOfPartitions = 1000000
   14. aggregates.creation.timeout = 8.hours
   15. schema.softPublish.aggs.enable = false
   16. databricks.querycache.disable = true (for Databricks SQL only)
   15. query.planning.bigquery.alwaysExpandWindowFunctions (for BigQuery only)
4. Import the appropriate cube definition XML file into AtScale instance (located in the `/cube` directory)
5. Publish the project using AtScale Design Center
6. Run the training mode script to generate the AtScale aggregates (see `run-atscale-train-example.sh` script for an example)
7. Prepare the Google BigQuery reporting environment
   1. Create a Google BigQuery project to capture the results of the JMeter tests
   2. Create a Google BigQuery JSON credentials file for the project and download it to a local directory
   3. Update the Google BigQuery information in the `/benchmark-results-loader/config_default.yml` file with the appropriate information
   4. After running the training mode script, record the elapsed time it took to build the AtScale aggregates and update the reporting view script `/scripts/sql/Reporting/reporting_views.sql` for the `agg_cost` field for the appropriate platform.
   5. Update the reporting view script `/scripts/sql/Reporting/reporting_views.sql` with the platform cost calculation for the `run_cost` field for the appropriate platform.
8. Run the `./RunJMeterBenchmark.sh` to generate the JMeter results for the RAW TPC-DS queries (see `run-bigquery-example.sh` script for an example)
9. Run the `./RunJMeterBenchmark.sh` to generate the JMeter results for the AtScale TPC_DS queries (see `run-atscale-example.sh` script for an example). The `./RunJMeterBenchmark.sh` script will upload the JMeter outputs into a Google BigQuery table.  The Tableau Workbook `/workbooks/Tableau/TPC-DS-BenchmarkResultsReports.twb` will generate all the charts and graphs using the RunLabel parameter as the identifier

## Platform Specific Customizations

1. For BigQuery and Redshift, adding a query hint to the outbound AtScale query will defeat their query cache.  For Snowflake, you need to run the following command to insure that the Snowflake cache is defeated: `ALTER USER atscale-engine-user-name SET USE_CACHED_RESULT = FALSE;`
2. For Azure Synapse SQL, we need to create 2 data warehouse connections so that the aggregate builds can use a *largerc* workgroup and the queries can use a *smallrc*. Make sure to run the commands in this DLL file: `scripts/sql/DDL/dd-synapse-create-users.sql`. For the *raw* run, you must use the atscale_agg_user (*largerc*) for the JMeter user.

## Harness Script Run Instructions

`./RunJMeterBenchmark.sh` - runs the JMeter benchmark suite for a chosen data platform (including AtScale) that will:

1. Run the appropriate JMeter JMX script with the supplied parameters
2. Call the results data loader JAR that will load the results into Google BigQuery for analysis

### Parameters
1. `-r` -> RunLabel: A directory label for identifying the test run (example: `SnowFlakeRun.2019.08.30`) *NOTE: DON'T USE '-' IN THE NAME SINCE THIS IS USED IN PARSING THE OUTPUT!*
2. `-j` -> JMeter executable location (example: `../../../jmeter/apache-jmeter-5.1.1/bin/jmeter.sh`)
3. `-x` -> JMXFilename location (example: `../jmeter/TPC-DS-Benchmark-AtScale.jmx`)
4. `-d` -> Data Platform Name (possible values: `AtScale`, `Snowflake`, `BigQuery`, `Reshift`) 
5. `-s` -> JDBCConnectionString (example: `jdbc:hive2://atscale-node-01.docker.infra.atscale.com:11111`) 
6. `-u` -> Data platform user name (example: `admin`)
7. `-p` -> Data platform password
8. `-n` -> AtScale Project Name (Omit for non-AtScale platforms) (example: `TPC-DS Benchmark Model - Snowflake"`)
9. `-l` -> Output directory for JMeter CSV & HTML file (example: `../../../Benchmark-Results`)
10. `-m` -> Mode [Optional] (possible values: `test`, `train`) note: `train` option is for AtScale only

*Note: You need to copy your BigQuery service credentials file into the same directory as the `RunJMeterBenchmark.sh` script for the data to be loading into BigQuery.  The file needs to be named `bigquery-credentials.json`*

## AtScale Agg Training Script Run Instructions

`./Train-AtScale.sh` - runs the AtScale aggregates training script that will:

1. Unpublish/Publish the Project
2. Run the `./RunJMeterBenchmark.sh` script with the 'train' mode flag enabled for 1 thread
3. Run the `./Wait-For-Aggregates.sh` script to make sure all aggregates are built before exiting the script.

### Parameters
1. `-r` -> RunLabel: A directory label for identifying the test run (example: `SnowFlakeRun.2019.08.30`) *NOTE: DON'T USE '-' IN THE NAME SINCE THIS IS USED IN PARSING THE OUTPUT!*
2. `-j` -> JMeter executable location (example: `../../../jmeter/apache-jmeter-5.1.1/bin/jmeter.sh`)
3. `-x` -> JMXFilename location (example: `../jmeter/TPC-DS-Benchmark-AtScale.jmx`)
5. `-s` -> JDBCConnectionString (example: `jdbc:hive2://atscale-node-01.docker.infra.atscale.com:11111`) 
6. `-u` -> Data platform user name (example: `admin`)
7. `-p` -> Data platform password
8. `-n` -> AtScale Project Name (Omit for non-AtScale platforms) (example: `TPC-DS Benchmark Model - Snowflake"`)
9. `-l` -> Output directory for JMeter CSV & HTML file (example: `../../../Benchmark-Results`)
10. `-b` -> AtScale Project GUID (You can find this in the URL that displays when you click on the project in Design Center)

## Results Data Loader

`java -jar benchmark-results-loader-1.0-SNAPSHOT-jar-with-dependencies.jar` - runs a Java program that will:

1. Load CSV file results from a `RunJMeterBenchmark.sh` run into a Google BigQuery table
2. Create/Update a View that parses the JMeter Label field into the following: 'Run Label', 'Query', 'Platform', '# of Theads'

Use the Tableau Workbook `TPC-DS-BenchmarkResultsReports.twb` to explore this data

### Parameters
1. `-f` -> CSV file name and location (automatically supplied if running `RunJMeterBenchmark.sh` script
2. `-t` -> Truncate (true) or Append (false) results.  This is optional and defaults to Append (false)

## Complexity Scorer Analyzer Utility

`java -jar /Users/davidmariani/workspace/atscale/benchmark/benchmark-complexity-scorer/target/benchmark-complexity-scorer-1.0-SNAPSHOT-jar-with-dependencies.jar` - runs a Java program that will:

1. Process a file with ';' delimited SQL statements and calculate a SQL "complexity" score using the following factors:
* Number of functions
* Number of operations
* Number of tables
* Number of objects
* Number of subqueries

### Parameters
1. `-f` -> SQL file name and location
2. `-v` -> Verbose flag.  If 'true', will show all matching constructs in addition to final tabulated results
