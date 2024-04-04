#!/bin/bash

echo "Repository Name: $GITHUB_REPOSITORY"

SIZE=$(curl -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/$GITHUB_REPOSITORY" | grep "size" | xargs | sed 's/size: //g' | sed 's/,//g')

re='^[0-9]+$'
if [[ $SIZE =~ $re ]] ; then
  echo $SIZE
  echo "size=$SIZE" >> "$GITHUB_OUTPUT"
else
  echo "Error: Not able to get repository size"
  exit 1
fi