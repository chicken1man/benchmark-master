#!/bin/bash

usage() { echo "Usage: $0 [-a AtScale API URL (not incl port)<i.e. http://atscale-node-01.docker.infra.atscale.com>] [-u UserName <AtScale User Name>] [-p Password <AtScale Password>]" 1>&2; exit 1; }

while getopts ":u:p:a:" o; do
    case "${o}" in
        a)
            a=${OPTARG}
            ;;
        u)
            u=${OPTARG}
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${a}" ]|| [ -z "${u}" ]|| [ -z "${p}" ]; then
    usage
fi

user="${u}"
password="${p}"
atscaleapiurl="${a}"

echo "user = ${u}"
echo "password = *******"
echo "atscale API server URL = ${a}"

WAIT_TIME=30
SLEEP_TIME=60
MAX_LOOP=300

function wait_for() {
    jwt=`curl -s -u ${user}:${password} ${atscaleapiurl}:10500/default/auth`
    response=`curl -k -s -H "Authorization:Bearer $jwt" "${atscaleapiurl}:10502/queries/orgId/default?limit=20&querySource=system&status=running"`
    if [[ "$response" = *"\"data\" : [ ]"* ]]; then
        echo "ok"
    else
        echo "wait-more"
    fi
}


LOOP_COUNT=0
while [ "$(wait_for)" != "ok" ]; do
  [ $LOOP_COUNT -eq 0 ] && echo -n "Waiting ${SLEEP_TIME}s for Aggregates to complete building..." || echo -n "."
  if [ $((LOOP_COUNT++)) -gt $MAX_LOOP ]; then
    exit 123
  fi
  sleep $SLEEP_TIME
done

[ $LOOP_COUNT -ne 0 ] && echo -e "\nWaited $((LOOP_COUNT*SLEEP_TIME))s Aggregates to complete building."

exit 0