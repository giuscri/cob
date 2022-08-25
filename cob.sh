# Returns HEAD commit message formatted as a valid branch name
msg2bname() {
  _msg2bname $(git show -s --format=%s)
}

_msg2bname() {
  echo $1 | tr '(' '_' | tr -d '):' | tr ' ' '-'
}

# Returns branch name formatted as a commit message
bname2msg() {
  _bname2msg $(git branch --show-current)
}

_bname2msg() {
  bname=$1
  if [[ $(echo $bname | grep '_') ]]; then
    echo $bname | sed 's,_\([^-]*\),(\1):,' | tr '-' ' '
  else
    echo $bname | sed 's,-,: ,' | tr '-' ' '
  fi
}
