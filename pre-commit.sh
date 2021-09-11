#!/bin/sh

# stash unstaged changes
STASH_NAME="pre-commit-$(date +%s)"
git stash save -q --keep-index $STASH_NAME

# do the stuff
for f in $(ls *_latex.md); do 
  markdown-math-gh-compiler $f -o $(basename -s _latex.md $f).md; 
done
# markdown-math-gh-compiler README_latex.md -o README.md
# stage the updates
git add .

# pop the stash to return repo to previous condition
STASHES=$(git stash list)
if [[ $STASHES == "$STASH_NAME" ]]; then
  git stash pop -q
fi
