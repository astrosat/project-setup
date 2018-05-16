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
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/good%20first%20issue

## State Labels
# CODE REVIEW
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Code Review","color":"2b7505"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

## Function Labels
# DEVOPS
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"DevOps","color":"f9ce68"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
# FRONT-END
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Front-End","color":"f9ce68"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
# BACK-END
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Back-End","color":"f9ce68"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
