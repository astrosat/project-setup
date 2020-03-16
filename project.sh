#!/usr/bin/env bash
# set -x
LOGFILE="project.log"
TOKEN=$1
ORG=$2
REPO_NAME=$3
DESCRIPTION=$4

echo ''
echo 'This script will remove the GitHub default labels and create the labels we will use in Astrosat. 

NOTE: A personal access token is required to access private repos.'

generateProjectData()
{
  cat <<EOF
  {
    "name":"${REPO_NAME}",
    "body":"${DESCRIPTION}"
  }
EOF
}

curl -vvv -H "Accept: application/vnd.github.inertia-preview+json" -u $TOKEN:x-oauth-basic --include --request POST --data "$(generateProjectData)" "https://api.github.com/orgs/${ORG}/projects" > $LOGFILE 2>&1
