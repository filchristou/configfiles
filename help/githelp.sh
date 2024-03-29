#git pretty log
git log --graph --oneline --decorate --all
#show branches and their tracked remote branched
git branch -vv

#delete local branches, for which the remote branches are deleted
git remote prune origin

#delete remote branches 
git push origin --delete name_of_the_remote_branch

#create and switch to a branch named "sf" that tracks the remote branch "serverfix"
git checkout -b sf origin/serverfix

#git push to a remote branch with a different name from the local branch
git push origin local-name:remote-name
#git push to a remote branch and track (used to create new remote branch from new local branch)
git push -u origin local-name:remote-name

#rebase interactive. Commit will be base just after <commit_hash>
git rebase -i <commit_hash>

#merge. use --no-ff for NO fast-forwarding
git checkout master
git merge --no-ff feature-branch

#to see changes since last save of the file
git diff --no-index file1 file2

#reset all files to the last commit (where HEAD is)
git reset --hard HEAD

#git stash
git stash save "a meaningfull message"
#show queue of stashes
git stash list
#git stash pop the 3rd shash (use "git stash apply" to not deleted from stash list)
git stash pop stash@{2}
#git stash partially
git stash -p

#update the remote branches localy
git remote -v update

#revert file to it's staged value
git checkout <file>
#rever all files
git checkout -- .

#unstage file
git remove <file> #check

#force a branch pointer to point to a different commit
git branch -f <branch-name> [<new-tip-commit>]

#git diff only for files with regex
git diff 1652081 -- '*.java'

