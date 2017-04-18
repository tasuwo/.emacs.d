# これはなに

自分用の Emacs 設定ファイル．

## Requirements

### 最新バージョンのEmacs

```shell
$ brew install emacs --cocoa
$ brew linkapps
```

### Cask

```shell
$ brew install cask
$ cask install
$ cask update
```

### Snippets

```shell
$ cd ~/.emacs.d/snippets
$ ~/.emacs.d/snippets/install-snippets.sh
```

### Migemo

```shell
$ brew install cmigemo
```

### for C/C++ mode

```shell
$ brew install emacs-clang-complete-async
```

### for js2-mode

`tern` と `eslint`．

```shell
$ npm install -g tern eslint babel-eslint eslint-plugin-react
# インストールチェック
$ eslint -v
# 設定ファイルのチェック
# ここでこけていると，emacs 側で無言で javascript-eslint が disabled になるので注意
$ eslint --print-config .
```

[EmacsにternをインストールしてjQueryを補完する -- blog.10rane.com](http://blog.10rane.com/2015/08/06/how-to-install-and-setup-tern/)

### for Clisp on SLIME

```shell
$ brew install clisp
```

### for python-mode

Pylint のために `~/.pylintrc`を用意する．

```json
[FORMAT]
indent-string=\t
```

### for apples-mode

tmpファイルが作成されるため，apples-modeをインストールしたディレクトリに権限を付加する．

### for yatex-mode

MacTeXをインストールし，以下のような`platex2pdf`ファイルを用意する．

``` shell
#!/bin/sh
test -n "$1" || echo "usage: platex2pdf [tex-file]"
test -n "$1" || exit 1 # 引数が無ければ syntax を表示して終了
TEX=$*
DVI=`/usr/bin/basename "$TEX" ".tex"`
THECODE=`nkf -g "$TEX"`
case $THECODE in # nkf が返す文字コードにあわせる
    UTF-8) KANJI="-kanji=utf8";;
    EUC-JP) KANJI="-kanji=euc";;
    Shift-JIS) KANJI="kanji=sjis";;
    ISO-2022-JP) KANJI="-kanji=jis";;
esac
PLATEX="platex"
CLASS=`sed -n '/documentclass/p' $* | sed '/%.*documentclass/d' | sed -n '1p'`
case $CLASS in
    *{u*) PLATEX="uplatex";;
esac
$PLATEX $KANJI $TEX # platex コマンドの発行
dvipdfmx $DVI # dvipdfmx コマンドの発行
```

[モダンな日本語 TeX 環境を整える - Qiita](http://qiita.com/ynakayama/items/706ae9e59c1b6fd3e3d2)

### for text

``` shell
$ npm install -g textlint
```

## マウスを使う

>[MouseTerm](https://bitheap.org/mouseterm/)

## python env

```shell
$ pip install virtualenv
$ pip install virtualenvwrapper
$ mkdir ~/.virtualenvs
```

`.zshrc` に以下を追記する．

```shell
export WORKON_HOME=$HOME/.virtualenvs
```

さらに，`M-x jedi:install-server`を実行する

