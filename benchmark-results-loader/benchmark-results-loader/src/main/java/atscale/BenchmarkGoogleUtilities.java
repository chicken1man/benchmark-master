package atscale;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.channels.Channels;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeoutException;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.bigquery.BigQuery;
import com.google.cloud.bigquery.BigQueryOptions;
import com.google.cloud.bigquery.Field;
import com.google.cloud.bigquery.FieldList;
import com.google.cloud.bigquery.FieldValueList;
import com.google.cloud.bigquery.FormatOptions;
import com.google.cloud.bigquery.Job;
import com.google.cloud.bigquery.JobId;
import com.google.cloud.bigquery.JobInfo;
import com.google.cloud.bigquery.JobInfo.WriteDisposition;
import com.google.cloud.bigquery.JobStatistics.LoadStatistics;
import com.google.cloud.bigquery.QueryJobConfiguration;
import com.google.cloud.bigquery.Schema;
import com.google.cloud.bigquery.Table;
import com.google.cloud.bigquery.TableDataWriteChannel;
import com.google.cloud.bigquery.TableDefinition;
import com.google.cloud.bigquery.TableId;
import com.google.cloud.bigquery.TableResult;
import com.google.cloud.bigquery.WriteChannelConfiguration;

public class BenchmarkGoogleUtilities {
    private static BigQuery bigquery;
    private static String location;
    private static String datasetname;
    private static String datawarehousename;

    public static BigQuery getBigQuery() {
        return bigquery;
    }

    public static String getLocation() {
        return location;
    }

    public static String getDatasetName() {
        return datasetname;
    }

    public static String getDataWarehouseName() {
        return datawarehousename;
    }

    private static BenchmarkGetPropertyValues properties = new BenchmarkGetPropertyValues();

    public static void  loginBigQuery(String location, String dataWarehouseName, String datasetName)
        throws IOException, TimeoutException, Exception {

        BenchmarkGetPropertyValues.loadPropValues();

        datawarehousename = dataWarehouseName;
        datasetname = datasetName;

        File credentialsPath = new File(new File("").getAbsoluteFile()+ "/" + properties.getProperties().getgoogle_credentials_path());

        System.out.println(credentialsPath);

        FileInputStream serviceAccountStream = new FileInputStream(credentialsPath);

        GoogleCredentials credentials = ServiceAccountCredentials.fromStream(serviceAccountStream);
        bigquery = BigQueryOptions.newBuilder().setCredentials(credentials).build().getService();
    }

    public static TableResult runSelect(String sql)
            throws IOException, InterruptedException, TimeoutException, Exception {

        QueryJobConfiguration queryConfig = QueryJobConfiguration.newBuilder(sql).setUseLegacySql(false).build();

        // Create a job ID so that we can safely retry.
        JobId jobId = JobId.of(UUID.randomUUID().toString());
        Job queryJob = bigquery.create(JobInfo.newBuilder(queryConfig).setJobId(jobId).build());

        // Wait for the query to complete.
        queryJob = queryJob.waitFor();

        // Check for errors
        if (queryJob == null) {
            throw new RuntimeException("Job no longer exists");
        } else if (queryJob.getStatus().getError() != null) {
            // You can also look at queryJob.getStatus().getExecutionErrors() for all
            // errors, not just the latest one.
            throw new RuntimeException(queryJob.getStatus().getError().toString());
        }

        // Get the results.
        bigquery.getQueryResults(jobId);

        TableResult result = queryJob.getQueryResults();

        return result;
    }

    public static void loadFileToBigQuery(Path path, String tableName, String formatOptions, Boolean bTruncate,
            Long startTimeCreate) throws IOException, InterruptedException, TimeoutException, Exception {

        long startTimeLoad = System.nanoTime();

        TableId tableId = TableId.of(datasetname, tableName);

        WriteDisposition wd = bTruncate ? WriteDisposition.WRITE_TRUNCATE : WriteDisposition.WRITE_APPEND;
        FormatOptions fo = FormatOptions.json();

        if (formatOptions.equals("CSV")) {                       
            fo = FormatOptions.csv();
        } else if (formatOptions.equals("JSON")) {
            fo = FormatOptions.json();
        } else {
            throw new Exception("Unhandled file type: " + formatOptions);
        }

        WriteChannelConfiguration writeChannelConfiguration = WriteChannelConfiguration.newBuilder(tableId)
        .setFormatOptions(fo).setAutodetect(true).setWriteDisposition(wd).setIgnoreUnknownValues(true).build();        
        
        // The location must be specified; other fields can be auto-detected.
        JobId jobId = JobId.newBuilder().setLocation(location).build();
        TableDataWriteChannel writer = bigquery.writer(jobId, writeChannelConfiguration);

        // Write data to writer
        try (OutputStream outputStream = Channels.newOutputStream(writer)) {
            Files.copy(path, outputStream);
        }

        // Get load job
        Job job = writer.getJob();
        job = job.waitFor();
        LoadStatistics stats = job.getStatistics();

        if (job.getStatus().getError() != null && !job.getStatus().getError().getMessage().contains("field: as_data_gaming")) {
            System.out
                    .println("Error loading file: " + path.toString() + " to BigQuery: " + job.getStatus().getError());
            throw new RuntimeException(job.getStatus().getError().toString());
        }

        System.out.println("Loaded " + stats.getOutputRows() + " rows into table: " + tableName + ", in "
                + (startTimeLoad - startTimeCreate) / 1000000000 + "s creation, "
                + (System.nanoTime() - startTimeLoad) / 1000000000 + "s loading");
    }

    public static long doCreateTableAsSelect(String datasetName, String tableName, String customFunction,
            String sourceSql, String partitionColumn, String clusterColumn, Boolean bCheckIfExists)
            throws IOException, InterruptedException, TimeoutException, Exception {

        Boolean bExists = true;

        if (bCheckIfExists) {
            String sql = String.format(BenchmarkSQLConstants.SQL_CHECK_TABLE_EXISTS,
                    BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName, tableName);

            // Check if table exists
            TableResult resultRows = BenchmarkGoogleUtilities.runSelect(sql);

            if (resultRows.getTotalRows() == 0) {
                bExists = false;
            }
        }

        // If no rows, run a CTAS
        if (bCheckIfExists == false || !bExists) {

            String selectSQL = String.format(sourceSql, BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName,
                    tableName);

            String varCTAS;
            if (customFunction != "") {
                varCTAS = String.format(BenchmarkSQLConstants.SQL_CTAS_TEMP_FN, customFunction,
                        BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName, tableName, selectSQL);
            } else if (partitionColumn == null || clusterColumn == null) {
                varCTAS = String.format(BenchmarkSQLConstants.SQL_CTAS_NO_PARTITION,
                        BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName, tableName, selectSQL);
            } else {
                varCTAS = String.format(BenchmarkSQLConstants.SQL_CTAS, BenchmarkGoogleUtilities.getDataWarehouseName(),
                        datasetName, tableName, partitionColumn, clusterColumn, selectSQL);
            }

            QueryJobConfiguration queryConfig =
                    // Note that setUseLegacySql is set to false by default
                    QueryJobConfiguration.newBuilder(varCTAS)
                            // Save the results of the query to a permanent table.
                            .build();

            System.out.println(varCTAS);

            // Create a job ID so that we can safely retry.
            JobId jobId = JobId.of(UUID.randomUUID().toString());
            Job queryJob = bigquery.create(JobInfo.newBuilder(queryConfig).setJobId(jobId).build());

            // Wait for the query to complete.
            queryJob = queryJob.waitFor();

            // Check for errors
            if (queryJob == null) {
                throw new RuntimeException("Job no longer exists");
            } else if (queryJob.getStatus().getError() != null) {
                // You can also look at queryJob.getStatus().getExecutionErrors() for all
                // errors, not just the latest one.
                throw new RuntimeException(queryJob.getStatus().getError().toString());
            }

            // Get the results.
            bigquery.getQueryResults(jobId);

            TableResult result = queryJob.getQueryResults();
            return result.getTotalRows();
        }

        return 0;
    }

    public static long doMergeInto(String datasetName, String tableName, String sourceSql, String keys)
            throws IOException, InterruptedException, TimeoutException, Exception {

        long nRowsAffected = 0;

        String joinSql = "";
        String updateSql = "";
        String insertSql = "";

        // Build Up the Joins
        String[] keysList = keys.split(",");
        for (int i = 0; i < keysList.length; i++) {
            if (i > 0) {
                joinSql += " AND ";
            }

            joinSql += "T1." + keysList[i] + " = " + "T2." + keysList[i];
        }

        // Build Up the Updates & Inserts
        TableId tableId = TableId.of(BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName, tableName);
        Table table = bigquery.getTable(tableId);
        Schema schema = table.getDefinition().getSchema();
        FieldList fields = schema.getFields();

        for (Field f : fields) {
            if (updateSql.length() > 0) {
                updateSql += ",";
            }

            updateSql += "T1." + f.getName() + "=" + "T2." + f.getName();

            if (insertSql.length() > 0) {
                insertSql += ",";
            }

            insertSql += f.getName();
        }

        // First delete the row if it already exists
        String mergeSQL = String.format(BenchmarkSQLConstants.SQL_MERGE,
                BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName, tableName, sourceSql, joinSql, updateSql,
                insertSql, insertSql);

        nRowsAffected = doInsertOrDeleteOrMerge(datasetName, tableName, mergeSQL);

        return nRowsAffected;
    }

    public static long doInsertOrDeleteOrMerge(String datasetName, String tableName, String sourceSql)
            throws IOException, InterruptedException, TimeoutException, Exception {

        long nRowsAffected = 0;

        QueryJobConfiguration queryConfig =
                // Note that setUseLegacySql is set to false by default
                QueryJobConfiguration.newBuilder(sourceSql).build();

        // Create a job ID so that we can safely retry.
        JobId jobId = JobId.of(UUID.randomUUID().toString());
        Job queryJob = bigquery.create(JobInfo.newBuilder(queryConfig).setJobId(jobId).build());

        System.out.println(sourceSql);

        // Wait for the query to complete.
        queryJob = queryJob.waitFor();

        // Check for errors
        if (queryJob == null) {
            throw new RuntimeException("Job no longer exists");
        } else if (queryJob.getStatus().getError() != null) {
            // You can also look at queryJob.getStatus().getExecutionErrors() for all
            // errors, not just the latest one.
            throw new RuntimeException(queryJob.getStatus().getError().toString());
        }

        // Get the results.
        bigquery.getQueryResults(jobId);

        TableResult result = queryJob.getQueryResults();

        nRowsAffected = result.getTotalRows();

        return nRowsAffected;
    }

    public static void dropAllTablesInDataset(String datasetName, String filter)
            throws IOException, InterruptedException, TimeoutException, Exception {

        System.out.println("Dropping tables in dataset: " + datasetName + "...");

        String sql = String.format(BenchmarkSQLConstants.SQL_GET_TABLES_IN_DATASET,
                BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName);
        if (filter.length() > 0) {
            sql = String.format(BenchmarkSQLConstants.SQL_GET_TABLES_IN_DATASET_WHERE,
                    BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName, filter);
        }
        TableResult resultRows = BenchmarkGoogleUtilities.runSelect(sql);

        for (FieldValueList row : resultRows.iterateAll()) {
            String tableName = row.get("table_id").getStringValue();

            String dropSql = String.format("DROP TABLE `%s.%s.%s`", BenchmarkGoogleUtilities.getDataWarehouseName(),
                    datasetName, tableName);
            doInsertOrDeleteOrMerge(datasetName, tableName, dropSql);
        }

        System.out.println("Tables dropped.");
    }

    public static List<Field> getFields(String datasetName, String tableName)
            throws IOException, InterruptedException, TimeoutException, Exception {

        Table table = bigquery.getTable(datasetName, tableName);
        TableDefinition tableDef = table.getDefinition();
        List<Field> fieldList = tableDef.getSchema().getFields();

        return fieldList;
    }

    public static Boolean checkIfTableExists(String datasetName, String tableName)
            throws IOException, InterruptedException, TimeoutException, Exception {

        Boolean bExists = false;

        String sql = String.format(BenchmarkSQLConstants.SQL_CHECK_TABLE_EXISTS,
                BenchmarkGoogleUtilities.getDataWarehouseName(), datasetName, tableName);

        // Check if table exists
        TableResult resultRows = BenchmarkGoogleUtilities.runSelect(sql);

        // If no rows, run a CTAS
        if (resultRows.getTotalRows() > 0) {
            bExists = true;
        }

        return bExists;
    }

    public static void dropTable(String datasetName, String tableName)
            throws IOException, InterruptedException, TimeoutException, Exception {

        if (checkIfTableExists(datasetName,tableName)) {
            System.out.println("Dropping table: " + tableName + " in dataset: " + datasetName + "...");

            String dropSql = String.format("DROP TABLE `%s.%s.%s`", BenchmarkGoogleUtilities.getDataWarehouseName(),
                    datasetName, tableName);
            
            doInsertOrDeleteOrMerge(datasetName, tableName, dropSql);
    
            System.out.println("Table dropped.");
        }
    }
}