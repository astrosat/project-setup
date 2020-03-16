#!/usr/bin/env bash
# set -x
TOKEN=$1
REPO_NAME=$2

curl -H "Accept: application/vnd.github.inertia-preview+json" -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/projects/${REPO_NAME}
