# cob

# TL;DR
```
make install
```

---

- You committed to the main branch but later find you want to create a separate branch
  - [Launch `cob` to reuse the commit message to generate a branch name](https://github.com/giuscri/cob/blob/748c52dd7c392512749e842d55a892606c591913/test.sh#L11)
  - Examples of supported commit messages: _chore: change how db password is retrieved_, _feat(crypto): use blake2_
- You created a separate branch only for 1 commit
  - [Launch `cm` to reuse the branch name to generate a commit message](https://github.com/giuscri/cob/blob/748c52dd7c392512749e842d55a892606c591913/test.sh#L14)
  - Examples of supported branch names: _chore-change-how-db-password-is-retrieved_, _feat_crypto-use-blake-2_
