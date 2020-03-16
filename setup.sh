#!/usr/bin/env bash
# set -x
SCRIPTDIR=$(pwd)
LOGFILE="repository.log"
ORG='astrosat'

# Enter a SINGLE WORD ..or...separate with hyphens
read -p 'Enter your GitHub Personal Access Token: ' TOKEN
read -p "What name do you want to give your remote repo?" REPO_NAME
read -p "Enter a repo description: " DESCRIPTION
read -p "what is the absolute path to the parent directory?" PROJECT_PATH
read -p "Do you want an Organisational Project Board? [Yn]" PROJECT_BOARD
case $PROJECT_BOARD in
  [Nn]* ) ;;
  * ) 
    read -p "Project Board Name: " BOARD_NAME;
    read -p "Project Board Description: " BOARD_DESCRIPTION;;
esac

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

echo "STARTING - Create Repository"

echo "CREATE REPO" > $LOGFILE
curl -u $TOKEN:x-oauth-basic --include --request POST --data "$(generateRepoData)" "https://api.github.com/orgs/${ORG}/repos" >> LOGFILE 2>&1

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

if [ -z $BOARD_NAME ]; then
  echo ""
else
  echo "STARTING - Create Organisation Project Board"
  cd "${SCRIPTDIR}"
  echo "\n\n\nPROJECT BOARD" >> $LOGFILE
  sh ./projects.sh $TOKEN $ORG $BOARD_NAME $BOARD_DESCRIPTION
  echo "COMPLETE - Organisation Project Board setup at https://github.com/orgs/$ORG/projects."
fi

echo "STARTING - Create Repository Labels"
cd "${SCRIPTDIR}"
echo "\n\n\nLABELS" >> $LOGFILE
sh ./labels.sh $TOKEN $ORG $REPO_NAME
echo "COMPLETE - Respository Labels setup at https://github.com/$ORG/$REPO_NAME/labels."

