# Project Setup

This repo has a collection of scripts etc to make setting up a new Project more consistent and easy.

## Labels

**Labels** are used to categorize **issues**, we may have many repos and each repo should re-use the same labels. This script uses the GitHub API to **Delete** default labels that we don't use, while adding new ones we do.

Type `./labels.sh`, you will be asked for your **GitHub Personal Access Token** and the path to the repo e.g. **my-org/repo**.
