cob() {
  msg="$(git show -s --format=%s)"
  git checkout -b "$(_msg_to_bname "$msg")"
}

cm() {
  bname="$(git branch --show-current)"
  git commit --edit -m "$(_bname_to_msg "$bname")"
}

# Returns HEAD commit message formatted as a valid branch name
_msg_to_bname() {
  echo $1 | tr '(' '_' | tr -d '):' | tr ' ' '-'
}

# Returns branch name formatted as a commit message
_bname_to_msg() {
  bname=$1
  if [[ $(echo $bname | grep '_') ]]; then
    echo $bname | sed 's,_\([^-]*\),(\1):,' | tr '-' ' '
  else
    echo $bname | sed 's,-,: ,' | tr '-' ' '
  fi
}
