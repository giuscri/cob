# Returns HEAD commit message formatted as a valid branch name
msg2bname() {
  git show -s --format=%s | tr '(' '_' | tr -d '):' | tr ' ' '-' # chore(k8s): create secret -> chore_k8s-create-secret
                                                                 # chore: use correct db password -> chore-use-correct-db-password
}

# Returns branch name formatted as a commit message
bname2msg() {
  bname=$(git branch --show-current)
  if [[ $(echo $bname | grep '(') ]]; then
    echo $bname | sed 's,_\([^-]*\),(\1):,' | tr '-' ' ' # chore_k8s-create-secret -> chore(k8s): create secret
  else
    echo $bname | sed 's,-,: ,' | tr '-' ' ' # chore-use-correct-db-password -> chore: use correct db password
  fi
}
