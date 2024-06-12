# Git general tips
- commit regularly and subject/feature oriented
- commit shortly and concisely
- use rebase to combine small commits into one feature/subject
- use rebase instead of merging (cleaner history)

## Git config commands
- git config --global rerere.enabled true (enables easier rebasing trough "caching" already resolved conflicts)

## Git files
| file    | description |
| :-------------- | :----------- |
| .gitkeep | place this into an empty dir, so git recognizes it |
| .gitignore | place this into root directory of repository to list all files that should be ignored by git |
| .gitsubmodule | keeps track of submodules used inside a repository

## Git commands
| command    | description |
| :-------------- | :----------- |
| git log --oneline --graph --decorate --all (-n10)| overview of all branches and commit history |
| git blame | check who and when changed a line of a file |
| git diff (--staged / HEAD~1 HEAD) | check the differences between two versions of a file (by default current change vs. last commit) |
| git stash (list/drop/apply) | stash current changes locally |
| git add -p | walkthrough changes and add them partially |
| git tag -a v0.1 | tag a commit with a referencable version number tag
| git push --tags | push tags into remote repository |
| git push --force-with-lease | push force only if remote branch hasn't changed |
| git rebase -i HEAD~3 | clean up git history of last 3 commits |
| git submodule add <url> | adds a repository as a submodule |
| git range-diff | compare two commit ranges |
| git maintenance | starts a daemon service that fetches automatically remote branches, so pulling is faster |
