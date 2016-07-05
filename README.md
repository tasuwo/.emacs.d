# What is this?

This is my personal Emacs configulation.

## Requirements

### Latest version of Emacs

```bash
$ brew install emacs --cocoa
$ brew linkapps
```

### Cask


```bash
$ brew install cask
$ cask install
$ cask update
```

### Snippets

```bash
$ cd ~/.emacs.d/snippets
$ ~/.emacs.d/snippets/install-snippets.sh
```

### Migemo

for using megemo

```migemo
$ brew install cmigemo
```

## Others

### for C/C++ mode

``` shell
$ brew install emacs-clang-complete-async
```

### for js2-mode

```
npm install -g tern
```

Create `~/.tern-config` file.

```json
{
  "libs": [
    "browser",
    "jquery"
  ],
  "plugins": {
     "node": {}
  }
}
```

[EmacsにternをインストールしてjQueryを補完する -- blog.10rane.com](http://blog.10rane.com/2015/08/06/how-to-install-and-setup-tern/)

### for Clisp on SLIME

```
$ brew install clisp
```

### for Markdown-mode

```
$ brew install markdown
```

### for matlab-mode

Add a mlint to the path in `.emacs.d/inits/30-edit-mode-matlab.el`.

```
(flycheck-define-command-checker 'matlab-mlint
  "A Matlab checker based on mlint."
  :command `("/Applications/MATLAB_R2014a.app/bin/maci64/mlint" source)
  :error-patterns
  '((warning line-start "L " line " (C " (1+ digit) "): " (message) line-end)
    (warning line-start "L " line " (C " (1+ digit) "-" (1+ digit) "): " (message) line-end))
  :modes '(matlab-mode))
```

### for pytho-mode

Use a `~/.pylintrc` file to configure Pylint.

```
[FORMAT]
indent-string=\t
```

### for apples-mode

Add permission to apples-mode installed directory.
This mode make tmp file there.

## Using mouse

>[MouseTerm](https://bitheap.org/mouseterm/)

## python env

```bash
$ pip install virtualenv
$ pip install virtualenvwrapper
$ mkdir ~/.virtualenvs
```

in `.zshrc`

```bash
export WORKON_HOME=$HOME/.virtualenvs
```

and `M-x jedi:install-server`
