#!/usr/bin/env bash
# set -x
SCRIPTDIR=$(pwd)
LOGFILE="project.log"
ORG='astrosat'

# Enter a SINGLE WORD ..or...separate with hyphens
echo -n 'Enter your GitHub Personal Access Token: '
read -s TOKEN
echo ''
echo "What name do you want to give your remote repo?"
read REPO_NAME
echo ''
echo "Enter a repo description: "
read DESCRIPTION
echo ''
echo "what is the absolute path to the parent directory?"
read PROJECT_PATH

echo "STARTING - Create Repository"

echo "TOKEN: ${TOKEN}"
echo "ORG: ${ORG}"
echo "REPO NAME: ${REPO_NAME}"
echo "DESCRIPTION: ${DESCRIPTION}"
echo "PROJECT PATH: ${PROJECT_PATH}"

generateRepoData()
{
  cat <<EOF
  {
    "name":"${REPO_NAME}",
    "description":"${DESCRIPTION}", 
    "private":"true"
  }
EOF
}

echo "CREATE REPO" > $LOGFILE
curl -u $TOKEN:x-oauth-basic --include --request POST --data "$(generateRepoData)" "https://api.github.com/orgs/${ORG}/repos"
# >> LOGFILE 2>&1

mkdir "${PROJECT_PATH}/${REPO_NAME}"
cd "${PROJECT_PATH}/${REPO_NAME}"

# Initialise the repo locally, create blank README, add and commit
git init
touch README.MD
git add README.MD
git commit -m 'Initial Project Setup'

git remote add origin git@github.com:${ORG}/${REPO_NAME}.git
git push --set-upstream origin master

echo "COMPLETE - Respository setup at https://github.com/$ORG/$REPO_NAME."

echo "STARTING - Create Repository Labels"
cd "${SCRIPTDIR}"
echo "\n\n\nLABELS" >> LOGFILE
sh ./labels.sh $TOKEN $ORG $REPO_NAME
echo "COMPLETE - Respository Labels setup at https://github.com/$ORG/$REPO_NAME/labels."

