# gh-md-test

## Using [@jeremy-rifkin's solution](https://github.com/jeremy-rifkin/markdown-math-gh-compiler)

### Installation

```
npm install -g markdown-math-gh-compiler
```

This repo uses a [pre-commit Git hook](https://githooks.com/) to [convert LaTeX syntax into an embedded image](https://gist.github.com/a-rodin/fef3f543412d6e1ec5b6cf55bf197d7b) of the formula using GitHub's renderer. The source code with LaTeX syntax is found in the `*_latex.md` files, and the pre-commit script compiles these files into `*.md` files with the embedded images instead.

_TODO1: keep the `*_latex.md` files in a separate `src` dir so they don't clutter up a repo. This will probably also have to be done in the pre-commit script.__TODO2: TODO1 might mess with links from one `*.md` file to another? Need to preserve file structure. Also, relative links in source (`*_latex.md`) files need to be to the `*.md` version instead of the `*_latex.md` version._

The pre-commit script (which is run before every `git commit`) is [pre-commit.sh](pre-commit.sh). If you clone this repo and wish to use this Git hook as well, "install" the hook by running

```
chmod +x pre-commit.sh
ln -s ../../pre-commit.sh .git/hooks/pre-commit
```

in the root of this repo.(If you're confused about why the source file is prepended by `../../`, remember that the source file location must be given relative to the link name.)

### Example

My favorite equation is <img alt="e^{i\pi} = -1" src="https://render.githubusercontent.com/render/math?math=e%5E%7Bi%5Cpi%7D%20%3D%20-1" style="transform: translateY(20%);" />.

Here it is centered:

<p align="center"><img alt="e^{i\pi} = -1" src="https://render.githubusercontent.com/render/math?math=e%5E%7Bi%5Cpi%7D%20%3D%20-1"/></p>
