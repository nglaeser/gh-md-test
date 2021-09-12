# gh-md-test

Using [@jeremy-rifkin's solution](https://github.com/jeremy-rifkin/markdown-math-gh-compiler).

## Usage

Install the `markdown-math-gh-compiler` tool:

```
npm install -g markdown-math-gh-compiler
```

[Compile a file with LaTeX syntax into one with embedded images](https://gist.github.com/a-rodin/fef3f543412d6e1ec5b6cf55bf197d7b) of the formulas (using GitHub's renderer) with

```
markdown-math-gh-compiler myfile_latex.md -o myfile.md
```

_Note: This tool seems to dislike the markdown syntax of using two spaces at the end of a line to create a new line (a new paragraph, in HTML-speak). For line breaks, leave an empty line instead (underscore indicates a space):_

```
# don't do this
This is my first line.__
This is a new line.

# do this
This is my first line.

This is a new line.
```

## Pre-Commit Hook

This repo uses a [pre-commit Git hook](https://githooks.com/) to automate this process. The source code with LaTeX syntax is found in the `*_latex.md` files, and the pre-commit script compiles these files into `*.md` files with the embedded images instead.

> _TODO2: TODO1 might mess with links from one `*.md` file to another? Need to preserve file structure. Also, relative links in source (`*_latex.md`) files need to be to the `*.md` version instead of the `*_latex.md` version._

The pre-commit script (which is run before every `git commit`) is [pre-commit.sh](pre-commit.sh). If you clone this repo and wish to use this Git hook as well, "install" the hook by running

```
chmod +x pre-commit.sh
ln -s ../../pre-commit.sh .git/hooks/pre-commit
```

in the root of this repo.

(If you're confused about why the source file is prepended by `../../` in the `ln` command, remember that the source file location must be given relative to the link name.)

## Example

**Important: if you are using GitHub in dark mode, the equations will not be visible.**

My favorite equation is <img alt="e^{i\pi} = -1" src="https://render.githubusercontent.com/render/math?math=e%5E%7Bi%5Cpi%7D%20%3D%20-1" style="transform: translateY(20%);" />.

Here it is centered:

<p align="center"><img alt="e^{i\pi} = -1" src="https://render.githubusercontent.com/render/math?math=e%5E%7Bi%5Cpi%7D%20%3D%20-1"/></p>

<hr/>

Other potential tools:
* VSCode plugin to (manually and on a per-equation basis) do the same thing: [math-to-image](https://marketplace.visualstudio.com/items?itemName=MeowTeam.vscode-math-to-image). It also includes an option to create a local SVG instead.
* [Website](https://md-math.netlify.app/) that gives you both MD and HTML syntax for embedding the equation image
* [Another web app](https://tex-image-link-generator.herokuapp.com/) that does the same thing
