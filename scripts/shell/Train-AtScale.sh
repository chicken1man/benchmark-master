#!/bin/bash

usage() { echo "Usage: $0 [-r RunLabel <string for directory output name>] [-j JMeter executable location <Dir and Filename of JMX exe>] [-x JMXFilename <Dir and Filename of JMX file>] [-s JDBCConnectionString <JDBC URL>] [-u UserName <AtScale User Name>] [-p Password <AtScale Password>] [-n AtScale Project Name <i.e. TPC-DS Benchmark Model] [-l Output Root Directory <Location for Output Files>] [-a AtScale API URL (not incl port)<i.e. http://atscale-node-01.docker.infra.atscale.com>] [-b AtScale Project GUID]" 1>&2; exit 1; }

while getopts ":r:j:s:u:p:x:l:a:b:n:" o; do
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
        l)
            l=${OPTARG}
            ;;
        a)
            a=${OPTARG}
            ;;
        b)
            b=${OPTARG}
            ;;
        n)
            n=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${r}" ] || [ -z "${j}" ] || [ -z "${x}" ] || [ -z "${s}" ] || [ -z "${u}" ] || [ -z "${p}" ] || [ -z "${n}" ] || [ -z "${l}" ] || [ -z "${a}" ] || [ -z "${b}" ]; then
    usage
fi

runname="${r}"
jmeterexe="${j}"
jmxfile="${x}"
connectionstring="${s}"
user="${u}"
password="${p}"
outputdir="${l}"
atscaleapiurl="${a}"
atscaleprojectguid="${b}"
projectname="${n}"
platform="AtScale"
testmode="false"
genaggs="true"
trainingmode="true"
atscalepublishedprojectguid=""

echo "runname = ${r}"
echo "jmeterexe = ${j}"
echo "jmxfile = ${x}"
echo "connectionstring = ${s}"
echo "user = ${u}"
echo "password = *******"
echo "outputdir = ${l}"
echo "atscale API server URL = ${a}"
echo "atscale project GUID = ${b}"
echo "projectname = ${n}"

# Let's get our JWT token
jwt=`curl -s -u ${user}:${password} ${atscaleapiurl}:10500/default/auth`

# Now let's get the "engineId" which is the Published Project ID we need for the Unpublish call
response=`curl -k -s -H "Authorization:Bearer $jwt" "${atscaleapiurl}:10500/api/1.0/org/default/project/${atscaleprojectguid}" | python -c "import sys, json; print json.load(sys.stdin)['response']['annotations']['annotation'][2]['value']"`
if [ -z "${response}" ]; then
    echo "Error Getting published Project ID.  Exiting"
    echo "Response was: $response"
    exit 1
else
    # Let's extract the engineId from the Project's annotation ("name":"engineId","value":"926012a5-4316-4d23-6f9b-23010d63f594")
    atscalepublishedprojectguid="${response}"
    echo "atscale published project GUID = ${atscalepublishedprojectguid}"
fi

# First Unpublish (if published project GUID is not set, don't try to "unpublish")
if [[ ! -z "$atscalepublishedprojectguid" ]]; then
    response=`curl -X DELETE -H "Authorization:Bearer $jwt" "${atscaleapiurl}:10502/projects/orgId/default/schema/${atscalepublishedprojectguid}"`
    if [[ "$response" != *"200 OK"* ]]; then
        echo "Error Unpublishing Project.  Exiting"
        echo "Response from Unpublish was: $response"
        exit 1
    fi
else
    echo "WARNING!  Not unpublishing project so aggregates won't be deleted if the project is published!"
fi

# Now Publish
response=`curl -s -k POST -H "Authorization:Bearer $jwt" -H "Content-Type: application/json" --data "" "${atscaleapiurl}:10500/api/1.0/org/default/project/${atscaleprojectguid}/publish"`
if [[ "$response" != *response.ok* ]]; then
    echo "Error Unpublishing Project.  Exiting"
    echo "Response from Unpublish was: $response"
    exit 1
fi

# Now run the JMeter Suite
echo `./RunJMeterBenchmark.sh -r ${runname} -j ${jmeterexe} -x ${jmxfile} -d "AtScale" -s ${connectionstring} -u ${user} -p ${password} -n "${projectname}" -l ${outputdir} -m "train"`
./RunJMeterBenchmark.sh -r ${runname} -j ${jmeterexe} -x ${jmxfile} -d "AtScale" -s ${connectionstring} -u ${user} -p ${password} -n ${projectname} -l ${outputdir} -m "train"

# Now wait until aggregates are built by looking for no 'system' activity
./Wait-For-Aggregates.sh -a ${atscaleapiurl} -u ${user} -p ${password} 