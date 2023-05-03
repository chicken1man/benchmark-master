package atscale;

public class BenchmarkSQLConstants {

    public static final String SQL_CHECK_TABLE_EXISTS = "SELECT size_bytes FROM `%s.%s.__TABLES__` WHERE table_id='%s'";
    public static final String SQL_CHECK_ROW_EXISTS = "SELECT * FROM `%s.%s.%s` WHERE %s='%s'";
    public static final String SQL_CHECK_ROW_EXISTS_2_CONDITIONS_IN = "SELECT * FROM `%s.%s.%s` WHERE %s='%s' AND %s IN (%s)";
    public static final String SQL_GET_TABLES_IN_DATASET = "SELECT table_id FROM `%s.%s.__TABLES__`";
    public static final String SQL_GET_TABLES_IN_DATASET_WHERE = "SELECT table_id FROM `%s.%s.__TABLES__` WHERE %s";
    public static final String SQL_DELETE_WITH_WHERE = "DELETE FROM `%s.%s.%s` WHERE %s";
    public static final String SQL_SELECT = "SELECT %s FROM `%s.%s.%s`";
    public static final String SQL_SELECT_STAR = "SELECT * FROM `%s.%s.%s`";
    public static final String SQL_SELECT_WITH_WHERE = "SELECT %s FROM `%s.%s.%s` WHERE %s";
    public static final String SQL_SELECT_WITH_WHERE_ORDER = "SELECT %s FROM `%s.%s.%s` WHERE %s ORDER BY %s";
    public static final String SQL_INSERT = "INSERT INTO `%s.%s.%s` (%s) %s";
    public static final String SQL_CTAS = "CREATE OR REPLACE TABLE `%s.%s.%s` PARTITION BY %s CLUSTER BY %s AS %s";
    public static final String SQL_CTAS_NO_PARTITION = "CREATE OR REPLACE TABLE `%s.%s.%s` AS %s";
    public static final String SQL_MERGE = "MERGE `%s.%s.%s` T1 USING (%s) T2 ON %s WHEN MATCHED THEN UPDATE SET %s WHEN NOT MATCHED THEN INSERT (%s) VALUES (%s)";
    public static final String SQL_CTAS_TEMP_FN = "%s CREATE OR REPLACE TABLE `%s.%s.%s` AS %s";

    public static final String SQL_CREATE_RESULTS_TABLE = new StringBuilder()
    .append("SELECT ")
    .append("TRIM(SPLIT(SPLIT(label, '-')[OFFSET(1)], ':')[OFFSET(1)]) AS run_label, ")
    .append("TRIM(SPLIT(SPLIT(label, '-')[OFFSET(0)], ':')[OFFSET(1)])AS query, ")
    .append("TRIM(SPLIT(SPLIT(label, '-')[OFFSET(2)], ':')[OFFSET(1)]) AS platform, ")
    .append("TRIM(SPLIT(SPLIT(label, '-')[OFFSET(3)], ':')[OFFSET(1)]) AS threads, ")
    .append("TRIM(SPLIT(SPLIT(label, '-')[OFFSET(4)], ':')[OFFSET(1)]) AS loops, ")
    .append("TRIM(SPLIT(SPLIT(label, '-')[OFFSET(5)], ':')[OFFSET(1)]) AS iteration, ")
    .append("timeStamp, ")	
    .append("elapsed, ")
    .append("label, ")
    .append("CAST(responseCode AS STRING) AS responseCode, ")
    .append("responseMessage, ")
    .append("threadName, ")
    .append("dataType, ")
    .append("success, ")
    .append("failureMessage, ")
    .append("bytes, ")
    .append("sentBytes, ")
    .append("grpThreads, ")
    .append("allThreads, ")
    .append("URL, ")
    .append("Latency, ")	
    .append("IdleTime, ")	
    .append("Connect ")
    .append("FROM `%s.%s.%s`")
    .toString();

    public static final String SQL_MERGE_RESULTS_TABLE = new StringBuilder()
    .append("SELECT * ")
    .append("FROM `%s.%s.%s`")
    .toString();
}