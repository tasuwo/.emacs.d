#.emacs.d

##これはなに

私用の Emacs の設定ディレクトリ

##Depend

###最新版のEmacs

```bash
$ brew install emacs --cocoa
$ brew linkapps
```

###Cask

Cask を導入していない場合．

```bash
$ brew install cask
```

`.emacs.d` 下で以下により，依存パッケージをインストール．

```bash
$ cask install
$ cask update
```

###Snippets

```bash
$ cd ~/.emacs.d/snippets
$ ~/.emacs.d/snippets/install.sh
```

###SLIME で用いる CLISP 処理系

```
$ brew install clisp
```

###Markdown-mode を利用するために

```
$ brew install markdown
```

###yasnippet

```
$ cd ~/.emacs.d
$ mkdir snippets
$ cd snippets
$ git clone https://github.com/AndreaCrotti/yasnippet-snippets.git
```
>[AndreaCrotti/yasnippet-snippets](https://github.com/AndreaCrotti/yasnippet-snippets)

###matlab-mode

`.emacs.d/inits/30-edit-mode-matlab.el`に，`mlint`までのパスを通す必要がある．

```
(flycheck-define-command-checker 'matlab-mlint
  "A Matlab checker based on mlint."
  :command `("/Applications/MATLAB_R2014a.app/bin/maci64/mlint" source)
  :error-patterns
  '((warning line-start "L " line " (C " (1+ digit) "): " (message) line-end)
    (warning line-start "L " line " (C " (1+ digit) "-" (1+ digit) "): " (message) line-end))
  :modes '(matlab-mode))
```
