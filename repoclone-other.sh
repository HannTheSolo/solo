#!/bin/bash

echo "git clone --mirror ..."
git clone --mirror -v "$(SourceRepoUrl)" "$(Build.StagingDirectory)/git-repo"
echo "git clone --mirror ...done"

echo "git remote remove origin ..."
git -C "$(Build.StagingDirectory)/git-repo" remote remove origin
echo "git remote remove origin ...done"

echo "git remote -v ..."
git -C "$(Build.StagingDirectory)/git-repo" remote -v
echo "git remote -v ...done"

echo "git remote push --all ..."
git -c http.extraheader="AUTHORIZATION: bearer $SYSTEM_ACCESSTOKEN" -C "$(Build.StagingDirectory)/git-repo" push --all -v "$(DestinationRepoUrl)"
echo "git remote push --all ...done"

echo "git remote push --tags ..."
git -c http.extraheader="AUTHORIZATION: bearer $SYSTEM_ACCESSTOKEN" -C "$(Build.StagingDirectory)/git-repo" push --tags -v "$(DestinationRepoUrl)"
echo "git remote push --tags ...done"

