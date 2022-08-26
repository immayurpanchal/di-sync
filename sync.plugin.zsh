# DeepIntent Branch Sync Plugin
dis() {
  branchToSyncWith="$1"
  
  if [ -z "$branchToSyncWith" ]; then
    echo "Please Provide Branch Name"
    echo "Example: dis master"
    return 1
  fi

  echo "$(git pull)"
  echo "$(git checkout "$branchToSyncWith")"
  echo "$(git pull origin "$branchToSyncWith")"
  echo "$(git checkout -)"
  echo "$(git merge "$branchToSyncWith")"
}

# DeepIntent PR Generator plugin 

dipr(){
  prAgainstBranch="$1" # staging
  currentBranch="$(git branch --show-current)" # feat/di-123_test 
  projectName="$(git config --local remote.origin.url|sed -n 's#.*/\([^.]*\)\.git#\1#p')" # di-advertiser-ui

  echo "current branch is : ${currentBranch}, PR against : ${prAgainstBranch}"

  if [ -z "$prAgainstBranch" ]; then
    echo "Please Provide Branch Name"
    echo "Example: dipr staging"
    return 1
  fi

  newBranch="${currentBranch}_${prAgainstBranch}" # feat/di-123_test_staging

  echo "$(git checkout ${prAgainstBranch})" # git checkout staging 
  echo "$(git pull)" # git pull 
  echo "$(git checkout -b ${newBranch})" # git checkout -b feat/di-123_test_staging
  echo "$(git merge ${currentBranch})"# git merge feat/di-123_test
  echo "$(git push --set-upstream origin ${newBranch})" # git push 
  
  finalPRUrl="https://github.com/DeepIntent/${projectName}/compare/${prAgainstBranch}...${newBranch}" # https://github.com/immayurpanchal/di-sync/compare/staging...feat/di-123_test_staging
  echo "-----------------------------------------"
  echo "${finalPRUrl}" # open https://github.com/immayurpanchal/di-sync/compare/staging...feat/di-123_test_staging
  
  # echo "$(https://github.com/immayurpanchal/di-sync/pull/new/test)"
  # https://github.com/immayurpanchal/di-sync/compare/master...test?expand=1
}