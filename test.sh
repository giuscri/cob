#!/bin/bash -e

source ./cob.sh

assert() {
    expected=$1
    actual=$2
    [[ "$expected" = "$actual" ]] && echo "PASS" || echo "FAIL: $expected != $actual"
}

assert "chore_k8s-create-secret" "$(_msg2bname 'chore(k8s): create secret')"
assert "chore-use-correct-db-password" "$(_msg2bname 'chore: use correct db password')"

assert "chore(k8s): create secret" "$(_bname2msg 'chore_k8s-create-secret')"
assert "chore: use correct db password" "$(_bname2msg 'chore-use-correct-db-password')"
