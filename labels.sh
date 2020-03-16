#!/usr/bin/env bash
# set -x
LOGFILE="labels.log"
TOKEN=$1
ORG=$2
REPO_NAME=$3

echo ''
echo 'This script will remove the GitHub default labels and create the labels we will use in Astrosat. 

NOTE: A personal access token is required to access private repos.'

# Delete unwanted default labels
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/code%20review > $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/pull%20request >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/greenkeeper >> $LOGFILE 2>&1

curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/devops >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/frontend >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/backend >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/data >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/design >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/user%20story >> $LOGFILE 2>&1

curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/blocked >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/bug >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/duplicate >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/invalid >> $LOGFILE 2>&1

curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/enhancement >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/good%20first%20issue >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/${ORG}/${REPO_NAME}/labels/help%20wanted >> $LOGFILE 2>&1

## State Labels
# CODE REVIEW
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"code review","color":"fbca04","description":"Code being reviewed"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"pull request","color":"fbca04","description":"This is a Pull Request"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"greenkeeper","color":"fbca04","description":"3rd Party App"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1

## Function Labels
# devops|frontend|backend|data|design
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"devops","description":"Issue related to deployment|running|monitoring","color":"1d76db"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"frontend","description":"This is front-end related","color":"1d76db"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"backend","description":"This is back-end related","color":"1d76db"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"data","description":"This is Data related","color":"1d76db"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"design","description":"This is Design related","color":"1d76db"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"user story","description":"Descript Feature Scenarios","color":"1d76db"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1

## Issue type Labels
# blocked|bug|duplicate|invalid
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"blocked","description":"This issue is blocked by something","color":"ee0701"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"bug","description":"Something is not working","color":"ee0701"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"duplicate","description":"This issue or Pull Request already exists","color":"ee0701"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"invalid","description":"This is not right","color":"ee0701"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"enhancement","description":"New feature or request","color":"0e8a16"}' "https://api.github.com/repos/${ORG}/${REPO_NAME}/labels" >> $LOGFILE 2>&1
