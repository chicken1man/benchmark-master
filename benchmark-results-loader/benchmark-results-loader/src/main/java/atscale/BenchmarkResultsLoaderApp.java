package atscale;

import java.io.File;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;

public final class BenchmarkResultsLoaderApp {

    private static BenchmarkGetPropertyValues properties = new BenchmarkGetPropertyValues();

    private BenchmarkResultsLoaderApp() {
    }

    public static void main(String[] args) {

        Options options = new Options();

        try {
            // Parse Command Line

            Option filePath = new Option("f", "filePath", true, "Results CSV file path");
            filePath.setRequired(true);
            options.addOption(filePath);
    
            Option truncateFlag = new Option("t", "truncateFlag", true, "Truncate Flag (true=overwrite, false=append)");
            truncateFlag.setRequired(false);
            options.addOption(truncateFlag);

            DefaultParser parser = new DefaultParser();
            CommandLine cmd = parser.parse(options, args);

            // Load Configuration
            BenchmarkGetPropertyValues.loadPropValues();

            BenchmarkGoogleUtilities.loginBigQuery(properties.getProperties().getgoogle_location(),
                properties.getProperties().getgoogle_datawarehousename(),
                properties.getProperties().getgoogle_datasetname());

            File inputFilePath = new File(cmd.getOptionValue("filePath"));
            Boolean bTruncateFlag = false;
            
            if (cmd.getOptionValue("truncateFlag") != null)
                bTruncateFlag = cmd.getOptionValue("truncateFlag").equals("true") ? true : false;

            // Make sure the Input file is there
            if (!inputFilePath.exists()) {
                System.out.println("Can't find input CSV file: " + inputFilePath);
                System.exit(1);
            }

            // Replace the "null 0" response code that causes Google AutoDetect to fail
            Path path = Paths.get(cmd.getOptionValue("filePath"));
            Charset charset = StandardCharsets.UTF_8;

            String content = new String(Files.readAllBytes(path), charset);
            content = content.replaceAll("null 0", "0");
            Files.write(path, content.getBytes(charset));

            // Import the File into a staging area
            long startTime = System.nanoTime();
            BenchmarkGoogleUtilities.loadFileToBigQuery(inputFilePath.toPath(), "benchmark_results_raw", "CSV", true, startTime);

            // If Truncate, Drop the Destination table
            if (bTruncateFlag) {
                BenchmarkGoogleUtilities.dropTable(properties.getProperties().getgoogle_datasetname(), "benchmark_results_parsed");
            }

            // Transform the Raw table into the Staging Table
            String stagingSql = String.format(BenchmarkSQLConstants.SQL_CREATE_RESULTS_TABLE,
                BenchmarkGoogleUtilities.getDataWarehouseName(),
                properties.getProperties().getgoogle_datasetname(), 
                "benchmark_results_raw");

            System.out.println(stagingSql);

            BenchmarkGoogleUtilities.doCreateTableAsSelect(properties.getProperties().getgoogle_datasetname(),
                "benchmark_results_staging", "", stagingSql, null, null, false);

            // Check if we need to create the final "parsed" table
            if (BenchmarkGoogleUtilities.doCreateTableAsSelect(properties.getProperties().getgoogle_datasetname(),
                "benchmark_results_parsed", "", stagingSql, null, null, true) == 0) {

                // Merge the new rows
                String mergingSql = String.format(BenchmarkSQLConstants.SQL_MERGE_RESULTS_TABLE,
                    BenchmarkGoogleUtilities.getDataWarehouseName(),
                    properties.getProperties().getgoogle_datasetname(), 
                    "benchmark_results_staging");

                System.out.println(mergingSql);
                
                BenchmarkGoogleUtilities.doMergeInto(properties.getProperties().getgoogle_datasetname(),
                    "benchmark_results_parsed", mergingSql, "run_label,query,platform,threads,iteration,threadName");
            }

            System.out.println("Successfully loaded data for file: " + inputFilePath);

        } catch (ParseException e) {
            System.out.println(e.getMessage());
            HelpFormatter formatter = new HelpFormatter();
            formatter.printHelp("BenchmarkResultLoader", options);

            System.exit(1);
        } catch (Exception e) {
            System.err.println("An exception was caught :" + e.getMessage());
            e.printStackTrace();
        }
    }
}
