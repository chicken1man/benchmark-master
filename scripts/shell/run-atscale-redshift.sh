./RunJMeterBenchmark.sh -r "AtScale.Redshift.2019Q3" -j "/home/ec2-user/jmeter/apache-jmeter-5.1.1/bin/jmeter.sh" -x "../jmeter/TPC-DS-Benchmark-AtScale.jmx" -d "AtScale.Redshift" -s "jdbc:hive2://ec2-3-16-187-118.us-east-2.compute.amazonaws.com:11111" -u "admin" -p "admin" -n "tpc-ds benchmark model - redshift" -l "../../../Benchmark-Results"