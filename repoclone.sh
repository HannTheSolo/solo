#!/bin/bash

#Bash script to clone one repo from other server to local
echo "git remote remove origin ..."
git -C "$(Build.SourcesDirectory)" remote remove origin
echo "git remote remove origin ...done"

echo "git remote -v ..."
git -C "$(Build.SourcesDirectory)" remote -v
echo "git remote -v ...done"

echo "git remote push --all ..."
git -c http.extraheader="AUTHORIZATION: bearer $SYSTEM_ACCESSTOKEN" -C "$(Build.SourcesDirectory)" push --all -v "$(DestinationRepoUrl)"
echo "git remote push --all ...done"

echo "git remote push --tags ..."
git -c http.extraheader="AUTHORIZATION: bearer $SYSTEM_ACCESSTOKEN" -C "$(Build.SourcesDirectory)" push --tags -v "$(DestinationRepoUrl)"
echo "git remote push --tags ...done"

