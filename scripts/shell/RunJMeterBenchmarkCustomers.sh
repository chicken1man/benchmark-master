#!/bin/bash

usage() { echo "Usage: $0 [-r RunLabel <string for directory output name>] [-j JMeter executable location <Dir and Filename of JMX exe>] [-x JMXFilename <Dir and Filename of JMX file>] [-d Data Platform <Data Platform name (i.e. AtScale, Snowflake, etc.)>] [-s JDBCConnectionString <JDBC URL>] [-u UserName <AtScale User Name>] [-p Password <AtScale Password>] [-n AtScale Project Name (Omit for non-AtScale) <i.e. "TPC-DS Benchmark Model - Snowflake">] [-l Output Root Directory <Location for Output Files>] [-a AtScale Server Protocol <applicable for MDX or DAX suites: http or https>] [-b AtScale Server Name <applicable for MDX or DAX suites>] [-c AtScale Server Port <applicable for MDX or DAX suites>] [-m Mode (Optional) <test, train, useaggs>]" 1>&2; exit 1; }

while getopts ":r:j:s:u:p:x:d:l:m:n:a:b:c:" o; do
    case "${o}" in
        r)
            r=${OPTARG}
            ;;
        j)
            j=${OPTARG}
            ;;
        x)
            x=${OPTARG}
            ;;
        s)
            s=${OPTARG}
            ;;
        u)
            u=${OPTARG}
            ;;
        p)
            p=${OPTARG}
            ;;
        d)
            d=${OPTARG}
            ;;
        l)
            l=${OPTARG}
            ;;
        m)
            m=${OPTARG}
            ;;
        n)
            n=${OPTARG}
            ;;
        a)
            a=${OPTARG}
            ;;
        b)
            b=${OPTARG}
            ;;
        c)
            c=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${r}" ] || [ -z "${j}" ] || [ -z "${x}" ] || [ -z "${d}" ] || [ -z "${s}" ] || [ -z "${u}" ] || [ -z "${p}" ] || [ -z "${l}" ] || [ -z "${a}" ] || [ -z "${b}" ] || [ -z "${c}" ]; then
    usage
fi

runname="${r}"
jmeterexe="${j}"
jmxfile="${x}"
platform="${d}"
connectionstring="${s}"
atscaleserverprotocol="${a}"
atscaleservername="${b}"
atscaleserverport="${c}"
user="${u}"
password="${p}"
projectname="\`${n}\`"
outputdir="${l}"
mode="${m}"
testmode="false"
genaggs="false"
trainingmode="false"
useaggs="false"
numloops=1

starttime=$(date -u)

case "${m}" in
    "test")
        testmode="true"
        ;;
    "useaggs")
        useaggs="true"
        ;;
    "train")
        genaggs="true"
        trainingmode="true"
        if [ "$platform" != "AtScale" ]; then
            echo "WARNING: Training mode is onyl applicable for 'AtScale' platform type"
        fi
        ;;
    *)
        echo "Unknown or unset 'mode' setting.  Ignoring"
        ;;
esac

echo "runname = ${r}"
echo "jmeterexe = ${j}"
echo "jmxfile = ${x}"
echo "platform = ${d}"
echo "connectionstring = ${s}"
echo "atscaleserverprotocol = ${atscaleserverprotocol}"
echo "atscaleservername = ${atscaleservername}"
echo "atscaleserverport = ${atscaleserverport}"
echo "user = ${u}"
echo "password = *******"
echo "projectname = ${projectname}"
echo "outputdir = ${l}"
echo "mode = ${m}"
echo "testmode = ${testmode}"
echo "trainingmode = ${trainingmode}"
echo "genaggs = ${genaggs}"
echo "useaggs = ${useaggs}"

rm -rf ${outputdir}/${runname}
mkdir -p ${outputdir}/${runname}/CSV
mkdir -p ${outputdir}/${runname}/HTML

# Run for each thread grouping
# NOTE: Dave excluded 100 thread run on 2020-06-16 due to slow DWs
for i in `seq 1 4`;
do
    case "${i}" in
        1)
            numthreads=1

            # if we are only running 1 thread, run 5 loops so we average out the startup time
            if [ "$trainingmode" != "true" ] && [ "$testmode" != "true" ]; then
                numloops=5
            else
                numloops=1
            fi
            ;;
        2)
            numthreads=5
            numloops=1
            ;;
        3)
            numthreads=25
            numloops=1
            ;;
        4)
            numthreads=50
            numloops=1
            ;;
        5)
            numthreads=100
            numloops=1
            ;;
    esac

    # Pass in the proper parameters depending on the database type
    case "${platform}" in
        "Snowflake")
            driverclass="com.snowflake.client.jdbc.SnowflakeDriver"
            sessionstatement1="USE warehouse BENCHMARK_3XLARGE;"
            sessionstatement2="USE SCHEMA BENCHMARK.TPCDS_SF10TCL;"
            sessionstatement3="ALTER SESSION SET USE_CACHED_RESULT = FALSE;"

            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1=${sessionstatement1} -JSessionStatement2=${sessionstatement2} -JSessionStatement3=${sessionstatement3} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1="${sessionstatement1}" -JSessionStatement2="${sessionstatement2}" -JSessionStatement3="${sessionstatement3}" -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
        "SnowflakeOptimized")
            driverclass="com.snowflake.client.jdbc.SnowflakeDriver"
            sessionstatement1="USE warehouse BENCHMARK_3XLARGE;"
            sessionstatement2="USE SCHEMA BENCHMARK.TPCDS_SF10TCL;"
            sessionstatement3="ALTER SESSION SET USE_CACHED_RESULT = TRUE;"

            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1=${sessionstatement1} -JSessionStatement2=${sessionstatement2} -JSessionStatement3=${sessionstatement3} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1="${sessionstatement1}" -JSessionStatement2="${sessionstatement2}" -JSessionStatement3="${sessionstatement3}" -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
        "Redshift")
            driverclass="com.amazon.redshift.jdbc42.Driver"
            sessionstatement1="SET search_path TO tpcds10t;"
            sessionstatement2="set enable_result_cache_for_session to off;"
            sessionstatement3=""

            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1=${sessionstatement1} -JSessionStatement2=${sessionstatement2} -JSessionStatement3=${sessionstatement3} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1="${sessionstatement1}" -JSessionStatement2="${sessionstatement2}" -JSessionStatement3="${sessionstatement3}" -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
        "RedshiftOptimized")
            driverclass="com.amazon.redshift.jdbc42.Driver"
            sessionstatement1="SET search_path TO tpcds;"
            sessionstatement2="set enable_result_cache_for_session to on;"
            sessionstatement3=""

            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1=${sessionstatement1} -JSessionStatement2=${sessionstatement2} -JSessionStatement3=${sessionstatement3} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1="${sessionstatement1}" -JSessionStatement2="${sessionstatement2}" -JSessionStatement3="${sessionstatement3}" -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
        "BigQuery")
            driverclass="com.simba.googlebigquery.jdbc42.Driver"
            sessionstatement1=""
            sessionstatement2=""
            sessionstatement3=""

            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1=${sessionstatement1} -JSessionStatement2=${sessionstatement2} -JSessionStatement3=${sessionstatement3} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1="${sessionstatement1}" -JSessionStatement2="${sessionstatement2}" -JSessionStatement3="${sessionstatement3}" -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
        "Teradata")
            driverclass="com.teradata.jdbc.TeraDriver"
            sessionstatement1="DATABASE TPCDS_SF10TCL;"
            sessionstatement2=""
            sessionstatement3=""

            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1=${sessionstatement1} -JSessionStatement2=${sessionstatement2} -JSessionStatement3=${sessionstatement3} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1="${sessionstatement1}" -JSessionStatement2="${sessionstatement2}" -JSessionStatement3="${sessionstatement3}" -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
        "Synapse")
            driverclass="com.microsoft.sqlserver.jdbc.SQLServerDriver"
            sessionstatement1="SET RESULT_SET_CACHING OFF"
            sessionstatement2=""
            sessionstatement3=""

            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1=${sessionstatement1} -JSessionStatement2=${sessionstatement2} -JSessionStatement3=${sessionstatement3} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1="${sessionstatement1}" -JSessionStatement2="${sessionstatement2}" -JSessionStatement3="${sessionstatement3}" -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
        "Databricks")
            driverclass="com.simba.spark.jdbc.Driver"
            sessionstatement1="SET use_cached_result = false"
            sessionstatement2=""
            sessionstatement3=""

            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1=${sessionstatement1} -JSessionStatement2=${sessionstatement2} -JSessionStatement3=${sessionstatement3} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JDriverClass=${driverclass} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JSessionStatement1="${sessionstatement1}" -JSessionStatement2="${sessionstatement2}" -JSessionStatement3="${sessionstatement3}" -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
         "AtScale.Snowflake" | "AtScale.BigQuery" | "AtScale.Redshift" | "AtScale.Teradata" | "AtScale.Synapse" | "AtScale.Databricks")
            echo "${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JProjectName="${projectname}" -JQueryCacheFlag=${useaggs} -JCreateAggregatesFlag=${genaggs} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}"
            ${jmeterexe} -n -t ${jmxfile} -JLabel=${runname} -JNumberOfThreads=${numthreads} -JNumberOfLoops=${numloops} -JPlatform=${platform} -JJDBCConnectionString=${connectionstring} -JUserName=${user} -JPassword=${password} -JProjectName="${projectname}" -JQueryCacheFlag=${useaggs} -JCreateAggregatesFlag=${genaggs} -e -f -l ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output-Threads-${numthreads}
            ;;
        *)
            echo "Unhandled data platform: '{plaform}'.  Exiting'"
            exit
            ;;

    esac

    # Consolidate output files
    if [ "$i" = 1 ]; then
        echo "head -n 1 ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv > ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output.csv"
        head -n 1 ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv > ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output.csv
    fi

    echo "tail -q -n +2 ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv >> ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output.csv"
    tail -q -n +2 ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output-Threads-${numthreads}.csv >> ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output.csv

    # We will only run 1, 5, 25 threads for Raw (Dave's changed this because it takes longer to run on slow DBs)
    if [  ${platform:0:7} != "AtScale" ] && (( i > 3 )); then
        echo "Exiting.  Platform is not 'AtScale' so not running additional thread grouping"
        break
    fi

    # Break out after 1 loop if we are in Test Mode
    if [ "$testmode" = "true" ]; then
        echo "Exiting after 1 loop due to 'Test Mode'"
        break
    fi

    # Break out after 1 loop if we are in Traing Mode
    if [ "$trainingmode" = "true" ]; then
        echo "Exiting after 1 loop due to 'Training Mode'"
        break
    fi
done

endtime=$(date -u)

echo "Start Time= " ${starttime}
echo "End Time= " ${endtime}

# Generate HTML Output
#
echo "${jmeterexe} -g ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output"
${jmeterexe} -g ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output.csv -o ${outputdir}/${runname}/HTML/TCP-DS-Benchmark-Output

# Now load the data
#echo "java -jar benchmark-results-loader-1.0-SNAPSHOT-jar-with-dependencies.jar -f ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output.csv -t false"
#java -jar benchmark-results-loader-1.0-SNAPSHOT-jar-with-dependencies.jar -f ${outputdir}/${runname}/CSV/TCP-DS-Benchmark-Output.csv -t false
