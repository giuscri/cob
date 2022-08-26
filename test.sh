#!/bin/bash -e

source ./cob.sh

assert() {
    expected=$1
    actual=$2
    [[ "$expected" = "$actual" ]] && echo "PASS" || echo "FAIL: $expected != $actual"
}

assert "chore_k8s-create-secret" "$(_msg_to_branch_name 'chore(k8s): create secret')"
assert "chore-use-correct-db-password" "$(_msg_to_branch_name 'chore: use correct db password')"

assert "chore(k8s): create secret" "$(_branch_name_to_msg 'chore_k8s-create-secret')"
assert "chore: use correct db password" "$(_branch_name_to_msg 'chore-use-correct-db-password')"
