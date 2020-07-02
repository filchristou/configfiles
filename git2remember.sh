#delete local branches, for which the remote branches are deleted
git remote prune origin

#delete remote branches 
git push origin --delete name_of_the_remote_branch

#create and switch to a brand named "sf" that tracks the remote branch "serverfix"
git checkout -b sf origin/serverfix

#git push to a remote branch with a different name from the local branch
git push origin local-name:remote-name

#rebase interactive. Commit will be base just after <commit_hash>
git rebase -i <commit_hash>

#merge. use --no-ff for NO fast-forwarding
git checkout master
git merge --no-ff feature-branch
