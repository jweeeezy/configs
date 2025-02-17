# Git general tips
- commit regularly and subject/feature oriented
- commit shortly and concisely
- use rebase to combine small commits into one feature/subject
- use rebase instead of merging (cleaner history)
- never change history of a public branch (use pull requests / merges)

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
| git bisect | search mode for breaking change that can even use commands to automate and binary search for the commit that broke a certain behaviour |
| git log --oneline --graph --decorate --all (-n10)| overview of all branches and commit history |
| git log --grep="search_keyword" | display only logs that have search_keyword in it |
| git log -- filename.txt | display only logs that changed that file |
| git log -p | display logs + their changes |
| git blame | check who and when changed a line of a file |
| git diff (--staged / HEAD~1 HEAD) | check the differences between two versions of a file (by default current change vs. last commit) |
| git stash (list/drop/apply) -m "commit-message" | stash current changes locally |
| git add -p | walkthrough changes and add them partially |
| git tag -a v0.1 | tag a commit with a referencable version number tag
| git push --tags | push tags into remote repository |
| git push --force-with-lease | push force only if remote branch hasn't changed |
| git rebase -i HEAD~3 | clean up git history of last 3 commits |
| git submodule add <url> | adds a repository as a submodule |
| git range-diff | compare two commit ranges |
| git maintenance | starts a daemon service that fetches automatically remote branches, so pulling is faster |
