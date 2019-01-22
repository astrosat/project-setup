#!/usr/bin/env bash

echo ''
echo 'This script will remove the GitHub default labels and create the labels we will use in Astrosat. 

NOTE: A personal access token is required to access private repos.'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

echo ''
echo -n 'GitHub Org/Repo (e.g. foo/bar): '
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete unwanted default labels
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/code%20review
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/pull%20request
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/greenkeeper

curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/devops
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/frontend
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/backend
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/data
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/design
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/user%20story

curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/blocked
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid

curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/good%20first%20issue
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted

## State Labels
# CODE REVIEW
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"code review","color":"fbca04","description":"Code being reviewed"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"pull request","color":"fbca04","description":"This is a Pull Request"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"greenkeeper","color":"fbca04","description":"3rd Party App"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

## Function Labels
# devops|frontend|backend|data|design
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"devops","description":"Issue related to deployment|running|monitoring","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"frontend","description":"This is front-end related","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"backend","description":"This is back-end related","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"data","description":"This is Data related","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"design","description":"This is Design related","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"user story","description":"Descript Feature Scenarios","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

## Issue type Labels
# blocked|bug|duplicate|invalid
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"blocked","description":"This issue is blocked by something","color":"ee0701"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"bug","description":"Something is not working","color":"ee0701"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"duplicate","description":"This issue or Pull Request already exists","color":"ee0701"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"invalid","description":"This is not right","color":"ee0701"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"enhancement","description":"New feature or request","color":"0e8a16"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
