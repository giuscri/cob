cob() {
  msg="$(git show -s --format=%s)"
  git checkout -b "$(_msg_to_branch_name "$msg")"
}

cm() {
  bname="$(git branch --show-current)"
  git commit --edit -m "$(_branch_name_to_msg "$bname")"
}

# Returns HEAD commit message formatted as a valid branch name
# For example: `chore(infra): change db table encoding` becomes `chore_infra-change-db-table-encoding`
_msg_to_branch_name() {
  echo $1 | tr '(' '_' | tr -d '):' | tr ' ' '-'
}

# Returns branch name formatted as a commit message
# For example: `chore_infra-change-db-table-encoding` becomes `chore(infra): change db table encoding`
_branch_name_to_msg() {
  bname=$1
  if [[ $(echo $bname | grep '_') ]]; then
    echo $bname | sed 's,_\([^-]*\),(\1):,' | tr '-' ' '
  else
    echo $bname | sed 's,-,: ,' | tr '-' ' '
  fi
}
