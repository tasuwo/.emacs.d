#What is this?

This is my personal Emacs configulation.

##Requirements

###Latest version of Emacs

```bash
$ brew install emacs --cocoa
$ brew linkapps
```

###Cask


```bash
$ brew install cask
$ cask install
$ cask update
```

###Snippets

```bash
$ cd ~/.emacs.d/snippets
$ ~/.emacs.d/snippets/install-snippets.sh
```

###Migemo

for using megemo

```migemo
$ brew install cmigemo
```

##Others

###for Clisp on SLIME

```
$ brew install clisp
```

###for Markdown-mode

```
$ brew install markdown
```

###for matlab-mode

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

##Using mouse

>[MouseTerm](https://bitheap.org/mouseterm/)
