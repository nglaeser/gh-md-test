#!/bin/sh

# stash unstaged changes
STASH_NAME="pre-commit-$(date +%s)"
git stash save -q --keep-index $STASH_NAME

# do the stuff
for f in $(ls src/*_latex.md); do 
  markdown-math-gh-compiler $f -o $(basename -s _latex.md $f).md; 
  # example 
  # markdown-math-gh-compiler README_latex.md -o README.md
done
# stage the updates
git add .

# pop the stash to return repo to previous condition
STASHES=$(git stash list)
if [[ $STASHES == "$STASH_NAME" ]]; then
  git stash pop -q
fi
