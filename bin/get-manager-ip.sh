#!/bin/sh

command -v aws >/dev/null 2>&1 || { echo >&2 "aws-cli is required but it's not installed.  Aborting."; exit 1; }
command -v jq >/dev/null 2>&1 || { echo >&2 "jq is required but it's not installed.  Aborting."; exit 1; }

version() {
   echo "1.0.0"
}

helpmenu() {
   echo "
   NAME:
      get-manager - A command line tool to find the ip of manager node of dopplers
                    Docker swarm.

   USAGE:
      exercism [global options]

   VERSION:
      ${version}

   GLOBAL OPTIONS:
      --help, -h                show help
      --version, -v             print the version
      --production, -p          print the production ip address
      --staging, -s             print the staging ip address"
}

while [ ! $# -eq 0 ]
do
	  case "$1" in
      --help | -h)
        helpmenu
        exit
        ;;
      --production | -p)
        exit
        ;;
      --staging | -s)
        aws dynamodb get-item --table-name staging-large-dyndbtable --key '{"node_type": {"S": "primary_manager"}}' --profile swarm.staging | jq '.Item.ip.S'
        exit
        ;;
    esac
    shift
done

