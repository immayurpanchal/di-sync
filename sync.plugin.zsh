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
