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
