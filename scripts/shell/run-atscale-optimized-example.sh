./RunJMeterBenchmark.sh -r "Test" -j "../../../jmeter/apache-jmeter-5.1.1/bin/jmeter.sh" -x "../jmeter/TPC-DS-Benchmark-AtScale.jmx" -d "AtScaleOptimized" -s "jdbc:hive2://atscale-node-01.docker.infra.atscale.com:11111" -u "admin" -p "admin" -n "tpc-ds benchmark model - snowflake" -l "../../../Benchmark-Results" -m "test"