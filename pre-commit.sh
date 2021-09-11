#!/bin/sh

# stash unstaged changes
STASH_NAME="pre-commit-$(date +%s)"
git stash save -q --keep-index $STASH_NAME

# do the stuff
markdown-math-gh-compiler input.md -o output.md
# stage the updates
git add .

# pop the stash to return repo to previous condition
STASHES=$(git stash list)
if [[ $STASHES == "$STASH_NAME" ]]; then
  git stash pop -q
fi
